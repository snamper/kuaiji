class CreateZhuanjias < ActiveRecord::Migration
  def self.up
    create_table :zhuanjias do |t|
      t.column :name, :string
      t.column :sex, :string
      t.column :code, :string
      t.column :birthday, :string
      t.column :age, :string
      t.column :nations, :string
      t.column :idno, :string
      t.column :phone, :string
      t.column :address, :string
      t.column :zipcode, :string
      t.column :email, :string
      t.column :zhicheng_id, :integer
      t.column :political, :string
      t.column :hukou, :string
      t.column :zhichengno, :string
      t.timestamps
    end
  end

  def self.down
    drop_table :zhuanjias
  end
end
