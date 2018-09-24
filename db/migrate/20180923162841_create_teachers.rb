class CreateTeachers < ActiveRecord::Migration[5.2]
  def change
    create_table :teachers do |t|
      t.string :mobile, unll: false
      t.string :name, null: false
      t.string :degree, null: false
      t.integer :student_count, default: 0
      t.integer :chat_count, default: 0
      t.integer :chat_minutes, default: 0
      t.string :password_digest, null: false

      t.timestamps
    end

    add_index :teachers, :mobile, unique: true
  end
end
