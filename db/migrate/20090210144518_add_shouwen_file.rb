class AddShouwenFile < ActiveRecord::Migration
  def self.up
    add_column :shouwens, :filename, :string
  end

  def self.down
    remove_column :shouwens, :filename
  end
end
