class AddAd4 < ActiveRecord::Migration
  def self.up
    add_column :guanggaos, :ad4, :text
    add_column :guanggaos, :file4, :string
  end

  def self.down
    remove_column :guanggaos, :ad4
    remove_column :guanggaos, :file4
  end
end
