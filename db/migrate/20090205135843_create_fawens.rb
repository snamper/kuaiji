class CreateFawens < ActiveRecord::Migration
  def self.up
    create_table :fawens do |t|
      t.column :title, :string
      t.column :code, :string
      t.column :content, :string
      t.timestamps
    end
  end

  def self.down
    drop_table :fawens
  end
end
