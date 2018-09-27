class CreateChats < ActiveRecord::Migration[5.2]
  def change
    create_table :chats do |t|
      t.string :name, null: false
      t.integer :duration_minutes, default: 0

      t.timestamps
    end
  end
end
