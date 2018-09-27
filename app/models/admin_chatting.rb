class AdminChatting < ApplicationRecord
  belongs_to :chat,
             foreign_key: :chat_id,
             inverse_of: :admin_chattings

  belongs_to :admin,
             foreign_key: :admin_id,
             inverse_of: :admin_chattings

end
