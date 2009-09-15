class AddFawenFilename < ActiveRecord::Migration
  def self.up
    add_column :fawens, :filename, :string
  end

  def self.down
    remove_column :fawens, :filename
  end
end
