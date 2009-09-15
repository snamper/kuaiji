class AddZiyuanRemark < ActiveRecord::Migration
  def self.up
    add_column :ziyuans, :remark, :string
  end

  def self.down
    remove_column :ziyuans, :remark
  end
end
