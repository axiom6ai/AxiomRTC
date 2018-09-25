class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :mobile, null: false
      t.string :name, null: false
      t.integer :grade, null: false
      t.integer :teacher_id
      t.string :password_digest, null: false

      t.timestamps
    end

    add_index :students, :mobile, unique: true
    add_foreign_key :students, :teachers, column: :teacher_id, primary_key: :id
  end
end
