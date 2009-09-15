class AddFlowstepsUserId < ActiveRecord::Migration
  def self.up
    add_column :flowsteps, :user_id, :integer
  end

  def self.down
    remove_column :flowsteps, :user_id
  end
end
