class Chat < ApplicationRecord

  has_many :admin_chattings,
           foreign_key: :chat_id,
           inverse_of: :chat

  has_many :student_chattings,
           foreign_key: :chat_id,
           inverse_of: :chat

  has_many :teacher_chattings,
           foreign_key: :chat_id,
           inverse_of: :chat

  validates :name,
            presence: true,
            length: {maximum: 128}
end
