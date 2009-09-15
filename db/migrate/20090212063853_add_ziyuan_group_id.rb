class AddZiyuanGroupId < ActiveRecord::Migration
  def self.up
    add_column :ziyuans, :group_id, :string
  end

  def self.down
    remove_column :ziyuans, :group_id
  end
end
