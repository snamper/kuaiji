class CreateTjdanweis < ActiveRecord::Migration
  def self.up
    create_table :tjdanweis do |t|
      t.column :name, :string
      t.timestamps
    end
  end

  def self.down
    drop_table :tjdanweis
  end
end
