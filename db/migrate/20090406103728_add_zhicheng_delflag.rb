class AddZhichengDelflag < ActiveRecord::Migration
  def self.up
    add_column :zhichengs, :delflag, :integer
  end

  def self.down
    remove_column :zhichengs, :delflag
  end
end
