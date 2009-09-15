class CreateHuiyis < ActiveRecord::Migration
  def self.up
    create_table :huiyis do |t|
      t.column :title, :string
      t.column :content, :string
      t.column :status, :integer
      t.timestamps
    end
  end

  def self.down
    drop_table :huiyis
  end
end
