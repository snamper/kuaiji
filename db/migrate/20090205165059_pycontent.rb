class Pycontent < ActiveRecord::Migration
  def self.up
    add_column :shouwens, :pycontent, :text
  end

  def self.down
    remove_column :shouwens, :pycontent
  end
end
