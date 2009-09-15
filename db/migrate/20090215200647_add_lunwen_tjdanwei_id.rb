class AddLunwenTjdanweiId < ActiveRecord::Migration
  def self.up
    add_column :lunwens, :tjdanwei_id, :integer
  end

  def self.down
    remove_column :lunwens, :tjdanwei_id
  end
end
