class CreateGuanggaos < ActiveRecord::Migration
  def self.up
    create_table :guanggaos do |t|
      t.column :ad1, :text
      t.column :ad2, :text
      t.column :ad3, :text
      t.timestamps
    end
  end

  def self.down
    drop_table :guanggaos
  end
end
