class CreateBangongs < ActiveRecord::Migration
  def self.up
    create_table :bangongs do |t|
      
      t.timestamps
    end
  end

  def self.down
    drop_table :bangongs
  end
end
