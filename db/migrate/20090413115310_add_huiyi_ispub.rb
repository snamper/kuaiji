class AddHuiyiIspub < ActiveRecord::Migration
  def self.up
    add_column :huiyis, :ispub, :integer
  end

  def self.down
    remove_column :huiyis, :ispub
  end
end
