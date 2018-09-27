class CreateTeacherChattings < ActiveRecord::Migration[5.2]
  def change
    create_table :teacher_chattings do |t|
      t.integer :teacher_id, null: false
      t.integer :chat_id, null: false
      t.datetime :start_at, null: false
      t.datetime :end_at, null: false

      t.timestamps
    end

    add_index :teacher_chattings, :teacher_id
    add_index :teacher_chattings, :chat_id
    add_foreign_key :teacher_chattings, :teachers, column: :teacher_id, primary_key: :id
    add_foreign_key :teacher_chattings, :chats, column: :chat_id, primary_key: :id
  end
end
