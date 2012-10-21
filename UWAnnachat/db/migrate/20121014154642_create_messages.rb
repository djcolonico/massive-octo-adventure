class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
		t.integer :chatroom_id
		t.string  :author
		t.text    :body
      t.timestamps
    end
  end
end
