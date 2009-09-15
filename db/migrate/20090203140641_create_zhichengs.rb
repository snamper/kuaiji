class CreateZhichengs < ActiveRecord::Migration
  def self.up
    create_table :zhichengs do |t|
      t.column :name, :string
      t.timestamps
    end
  end

  def self.down
    drop_table :zhichengs
  end
end
