class CreateStudentChattings < ActiveRecord::Migration[5.2]
  def change
    create_table :student_chattings do |t|
      t.integer :student_id, null: false
      t.integer :chat_id, null: false
      t.datetime :start_at, null: false
      t.datetime :end_at, null: false

      t.timestamps
    end

    add_index :student_chattings, :student_id
    add_index :student_chattings, :chat_id
    add_foreign_key :student_chattings, :students, column: :student_id, primary_key: :id
    add_foreign_key :student_chattings, :chats, column: :chat_id, primary_key: :id
  end
end
