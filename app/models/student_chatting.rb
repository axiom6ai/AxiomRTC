class StudentChatting < ApplicationRecord
  belongs_to :chat,
             foreign_key: :chat_id,
             inverse_of: :admin_chattings

  belongs_to :student,
             foreign_key: :student_id,
             inverse_of: :student_chattings

end
