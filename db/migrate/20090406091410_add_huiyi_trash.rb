class AddHuiyiTrash < ActiveRecord::Migration
  def self.up
    add_column :huiyis, :delflag, :integer
  end

  def self.down
    remove_column :huiyis, :delflag
  end
end
