class CreateChats < ActiveRecord::Migration[5.2]
  def change
    create_table :chats do |t|
      t.string name, null: false
      t.integer :student_id
      t.datetime :student_started_at
      t.datetime :student_leaved_at
      t.integer :teacher_id
      t.datetime :teacher_started_at
      t.datetime :teacher_leaved_at
      t.integer :duration_minutes, default: 0

      t.timestamps
    end

    add_index :chats, :student_id
    add_index :chats, :teacher_id
    add_foreign_key :chats, :students, column: :student_id, primary_key: :id
    add_foreign_key :chats, :teachers, column: :teacher_id, primary_key: :id
  end
end
