class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table :articles do |t|
      t.column :title, :string
      t.column :category_id, :integer
      t.column :author, :string
      t.column :info, :text
      t.column :content, :text
      t.timestamps
    end
  end

  def self.down
    drop_table :articles
  end
end
