class AddHuiyiAuthor < ActiveRecord::Migration
  def self.up
    add_column :huiyis, :author, :string
  end

  def self.down
    remove_column :huiyis, :author
  end
end
