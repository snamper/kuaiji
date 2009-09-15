class AddUserDelflag < ActiveRecord::Migration
  def self.up
    add_column :users, :delflag, :integer
  end

  def self.down
    remove_column :users, :delflag
  end
end
