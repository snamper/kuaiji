class AddFlowstepUsername < ActiveRecord::Migration
  def self.up
    add_column :flowsteps, :username, :string
  end

  def self.down
    remove_column :flowsteps, :username
  end
end
