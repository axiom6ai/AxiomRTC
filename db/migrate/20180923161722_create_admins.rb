class CreateAdmins < ActiveRecord::Migration[5.1]
  def change
    create_table :admins, primary_key: :mobile, id: false do |t|
      t.string :mobile
      t.string :name, null: false
      t.string :password_digest, null: false
      t.integer :level, default: 0

      t.timestamps
    end
  end
end
