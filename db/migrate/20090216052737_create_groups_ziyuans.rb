class CreateGroupsZiyuans < ActiveRecord::Migration
  def self.up
    create_table 'groups_ziyuans' do |t|
      t.column :group_id, :integer
      t.column :ziyuan_id, :integer
    end
  end

  def self.down
    drop_table 'groups_ziyuans'
  end
end
