class AddLunwenScore < ActiveRecord::Migration
  def self.up
    add_column :lunwens, :score, :integer
  end

  def self.down
    remove_column :lunwens, :score
  end
end
