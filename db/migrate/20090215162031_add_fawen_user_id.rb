class AddFawenUserId < ActiveRecord::Migration
  def self.up
    add_column :fawens, :user_id, :integer
  end

  def self.down
    remove_column :fawens, :user_id
  end
end
