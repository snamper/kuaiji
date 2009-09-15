class AddArticleDelflag < ActiveRecord::Migration
  def self.up
    add_column :articles, :delflag, :integer
  end

  def self.down
    remove_column :articles, :delflag
  end
end
