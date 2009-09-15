class CreateScoretypes < ActiveRecord::Migration
  def self.up
    create_table :scoretypes do |t|
      t.column :name, :string
      t.timestamps
    end
  end

  def self.down
    drop_table :scoretypes
  end
end
