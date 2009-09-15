class CreateWorkflows < ActiveRecord::Migration
  def self.up
    create_table :workflows do |t|
      t.column :name, :string
      t.column :desc, :text
      t.timestamps
    end
  end

  def self.down
    drop_table :workflows
  end
end
