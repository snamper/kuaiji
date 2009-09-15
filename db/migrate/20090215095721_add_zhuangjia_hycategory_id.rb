class AddZhuangjiaHycategoryId < ActiveRecord::Migration
  def self.up
    add_column :zhuanjias, :hycategory_id, :integer
  end

  def self.down
    remove_column :zhuanjias, :hycategory_id
  end
end
