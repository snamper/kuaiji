class AddFile < ActiveRecord::Migration
  def self.up
    add_column :guanggaos, :file1, :string
    add_column :guanggaos, :file2, :string
    add_column :guanggaos, :file3, :string
  end

  def self.down
    remove_column :guanggaos, :file1
    remove_column :guanggaos, :file2
    remove_column :guanggaos, :file3
  end
end
