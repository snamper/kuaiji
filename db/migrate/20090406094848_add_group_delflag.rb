class AddGroupDelflag < ActiveRecord::Migration
  def self.up
    add_column :groups, :delflag, :integer
  end

  def self.down
    remove_column :groups, :delflag
  end
end
