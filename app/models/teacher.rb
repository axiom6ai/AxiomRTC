class Teacher < ApplicationRecord
  def self.degrees
    0..7
  end

  def self.to_degree_title(degree)
    case degree
    when 0
      'No'
    when 1
      'Bachelor'
    when 2
      'Master'
    when 3
      'Doctor'
    when 4
      'Post-doctor'
    when 5
      'Researcher'
    when 6
      'Associate-professor'
    when 7
      'Professor'
    else
      'Unknown'
    end
  end


  has_many :chats,
           foreign_key: :teacher_id,
           inverse_of: :teacher

  has_many :students,
           foreign_key: :teacher_id,
           inverse_of: :teacher

  has_secure_password

  validates :password,
            presence: true,
            length: {minimum: 8, maximum: 16},
            allow_nil: true

  validates :mobile,
            presence: true,
            format: {with: /\A\d{11}\z/},
            uniqueness: {case_sensative: true}

  validates :name,
            presence: true,
            length: {maximum: 128}

  validates :degree,
            presence: true,
            inclusion: {in: Teacher.degrees}

end
