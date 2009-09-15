class AddZhuanjiaDelflag < ActiveRecord::Migration
  def self.up
    add_column :zhuanjias, :delflag, :integer
  end

  def self.down
    remove_column :zhuanjias, :delflag
  end
end
