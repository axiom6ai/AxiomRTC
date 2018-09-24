class Student < ApplicationRecord
  def self.grades
    0..13
  end

  def self.to_grade_title(grade)
    case grade
    when 0
      'Kindergarten'
    when 1
      'Elementary-1'
    when 2
      'Elementary-2'
    when 3
      'Elementary-3'
    when 4
      'Elementary-4'
    when 5
      'Elementary-5'
    when 6
      'Elementary-6'
    when 7
      'Junior-high-school-1'
    when 8
      'Junior-high-school-2'
    when 9
      'Junior-high-school-3'
    when 10
      'Senior-high-school-1'
    when 11
      'Senior-high-school-2'
    when 12
      'Senior-high-school-3'
    when 13
      'Undergraduate and higher'
    else
      'Unknown'
    end
  end

  has_many :chats,
           foreign_key: :student_id,
           inverse_of: :student

  belongs_to :teacher,
             foreign_key: :teacher_id,
             inverse_of: :students

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

  validates :grade,
            presence: true,
            inclusion: {in: Student.grades}

end
