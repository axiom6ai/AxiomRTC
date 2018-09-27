class TeacherChatting < ApplicationRecord
  belongs_to :chat,
             foreign_key: :chat_id,
             inverse_of: :admin_chattings

  belongs_to :teacher,
             foreign_key: :teacher_id,
             inverse_of: :teacher_chattings

end
