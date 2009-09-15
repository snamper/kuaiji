class CreateWebconfigs < ActiveRecord::Migration
  def self.up
    create_table :webconfigs do |t|
      t.column :name, :string
      t.column :typename, :string
      t.column :content, :text
      t.timestamps
    end
  end

  def self.down
    drop_table :webconfigs
  end
end
