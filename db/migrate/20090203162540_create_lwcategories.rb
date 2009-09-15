class CreateLwcategories < ActiveRecord::Migration
  def self.up
    create_table :lwcategories do |t|
      t.column :name, :string
      t.timestamps
    end
  end

  def self.down
    drop_table :lwcategories
  end
end
