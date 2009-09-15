class AddLunwenAddAuthorUnit < ActiveRecord::Migration
  def self.up
    add_column :lunwens, :author_unit, :string
  end

  def self.down
    remove_column :lunwens, :author_unit
  end
end
