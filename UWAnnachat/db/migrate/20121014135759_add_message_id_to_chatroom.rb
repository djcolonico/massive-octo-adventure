class AddMessageIdToChatroom < ActiveRecord::Migration
  def change
    add_column :chatrooms, :message_id, :integer
  end
end
