class CreateAdminChattings < ActiveRecord::Migration[5.2]
  def change
    create_table :admin_chattings do |t|
      t.integer :admin_id, null: false
      t.integer :chat_id, null: false
      t.datetime :start_at, null: false
      t.datetime :end_at

      t.timestamps
    end

    add_index :admin_chattings, :admin_id
    add_index :admin_chattings, :chat_id
    add_foreign_key :admin_chattings, :admins, column: :admin_id, primary_key: :id
    add_foreign_key :admin_chattings, :chats, column: :chat_id, primary_key: :id
  end
end
