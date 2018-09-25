class CreateTeachers < ActiveRecord::Migration[5.2]
  def change
    create_table :teachers do |t|
      t.string :mobile, null: false
      t.string :name, null: false
      t.integer :degree, null: false
      t.string :password_digest, null: false

      t.timestamps
    end

    add_index :teachers, :mobile, unique: true
  end
end
