class CreateBaomings < ActiveRecord::Migration
  def self.up
    create_table :baomings do |t|
      t.column :name, :string
      t.column :sex, :string
      t.column :workunit, :string
      t.column :phone, :string
      t.column :ticket, :string
      t.column :remark, :text
      t.column :huiyi_id, :integer
      t.timestamps
    end
  end

  def self.down
    drop_table :baomings
  end
end
