class CreateChatrooms < ActiveRecord::Migration
  def change
    create_table :chatrooms do |t|
      t.string :name
      t.integer :user_id

      t.timestamps
    end
  end
end
