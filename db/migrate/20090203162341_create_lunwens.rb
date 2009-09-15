class CreateLunwens < ActiveRecord::Migration
  def self.up
    create_table :lunwens do |t|
      t.column :title, :string
      t.column :lwcategory_id, :integer
      t.column :author, :string
      t.column :keywords, :string
      t.column :filepath, :string
      t.column :content, :text
      t.timestamps
    end
  end

  def self.down
    drop_table :lunwens
  end
end
