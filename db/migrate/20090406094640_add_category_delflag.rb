class AddCategoryDelflag < ActiveRecord::Migration
  def self.up
    add_column :categories, :delflag, :integer
  end

  def self.down
    remove_column :categories, :delflag
  end
end
