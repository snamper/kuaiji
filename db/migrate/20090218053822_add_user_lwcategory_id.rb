class AddUserLwcategoryId < ActiveRecord::Migration
  def self.up
    add_column :users, :lwcategory_id, :integer
  end

  def self.down
  end
end
