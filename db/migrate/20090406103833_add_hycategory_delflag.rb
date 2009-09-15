class AddHycategoryDelflag < ActiveRecord::Migration
  def self.up
    add_column :hycategories, :delflag, :integer
  end

  def self.down
    remove_column :hycategories, :delflag
  end
end
