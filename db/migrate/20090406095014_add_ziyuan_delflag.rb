class AddZiyuanDelflag < ActiveRecord::Migration
  def self.up
    add_column :ziyuans, :delflag, :integer
  end

  def self.down
    remove_column :ziyuans, :delflag
  end
end
