class Chat < ApplicationRecord

  has_many :admin_chattings,
           foreign_key: :chat_id,
           inverse_of: :chat

  has_many :admins, through: :admin_chattings

  has_many :student_chattings,
           foreign_key: :chat_id,
           inverse_of: :chat

  has_many :students, through: :student_chattings

  has_many :teacher_chattings,
           foreign_key: :chat_id,
           inverse_of: :chat

  has_many :teachers, through: :teacher_chattings

  validates :name,
            presence: true,
            length: {maximum: 128}
end
