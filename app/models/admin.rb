class Admin < ApplicationRecord
  NORMAL = 0
  ROOT = 1

  def self.levels
    0..1
  end

  def self.to_level_title(level)
    case level
      when NORMAL
        'Normal'
      when ROOT
        'Root'
      else
        'Unknown'
    end
  end

  def self.level_map
    Admin.levels.map{|i| [Admin.to_level_title(i), i]}
  end

  self.primary_key = :mobile

  def to_param
    mobile
  end


  has_many :admin_chattings,
           foreign_key: :admin_id,
           inverse_of: :admin

  has_many :chats, through: :admin_chattings


  has_secure_password

  validates :password,
            presence: true,
            length: {minimum: 8, maximum: 16},
            allow_nil: true

  validates :name,
            presence: true,
            length: {maximum: 128}

  validates :mobile,
            presence: true,
            format: {with: /\A\d{11}\z/},
            uniqueness: {case_sensative: true}

  validates :level,
            inclusion: {in: Admin.levels}

  default_scope -> {order(level: :desc)}


  def root?
    level == Admin::ROOT
  end

  def level_title
    Admin.to_level_title level
  end

end

