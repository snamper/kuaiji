class AddReceiver < ActiveRecord::Migration
  def self.up
    add_column :fawens, :receiver, :text
  end

  def self.down
    remove_column :fawens, :receiver
  end
end
