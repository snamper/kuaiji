class CreateZiyuans < ActiveRecord::Migration
  def self.up
    create_table :ziyuans do |t|
      t.column :name, :string
      t.column :url, :string
      t.column :parent_id, :integer
      t.column :seq, :integer
      t.timestamps
    end
  end

  def self.down
    drop_table :ziyuans
  end
end
