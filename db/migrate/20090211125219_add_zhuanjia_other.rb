class AddZhuanjiaOther < ActiveRecord::Migration
  def self.up
    add_column :zhuanjias, :diqu, :string
    add_column :zhuanjias, :tjdanwei, :string
    add_column :zhuanjias, :gzdanwei, :string
    add_column :zhuanjias, :hyfenlei, :string
    add_column :zhuanjias, :zhiwu, :string
    add_column :zhuanjias, :xueli, :string
    add_column :zhuanjias, :techang, :string
    add_column :zhuanjias, :chuban, :string
    add_column :zhuanjias, :jiangli, :string
    add_column :zhuanjias, :othertechang, :string
    add_column :zhuanjias, :photo, :string
  end

  def self.down
    remove_column :zhuanjias, :diqu
    remove_column :zhuanjias, :tjdanwei
    remove_column :zhuanjias, :gzdanwei
    remove_column :zhuanjias, :hyfenlei
    remove_column :zhuanjias, :zhiwu
    remove_column :zhuanjias, :xueli
    remove_column :zhuanjias, :techang
    remove_column :zhuanjias, :chuban
    remove_column :zhuanjias, :jiangli
    remove_column :zhuanjias, :othertechang
    remove_column :zhuanjias, :photo
  end
end
