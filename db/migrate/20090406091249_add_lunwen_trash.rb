class AddLunwenTrash < ActiveRecord::Migration
  def self.up
    add_column :lunwens, :delflag, :integer
  end

  def self.down
    remove_column :lunwens, :delflag
  end
end
