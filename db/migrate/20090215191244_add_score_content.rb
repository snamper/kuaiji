class AddScoreContent < ActiveRecord::Migration
  def self.up
    add_column :scores, :content, :text
  end

  def self.down
    remove_column :scores, :content
  end
end
