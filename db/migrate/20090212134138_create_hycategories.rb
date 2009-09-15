class CreateHycategories < ActiveRecord::Migration
  def self.up
    create_table :hycategories do |t|
      t.column :name, :string
      t.timestamps
    end
  end

  def self.down
    drop_table :hycategories
  end
end
