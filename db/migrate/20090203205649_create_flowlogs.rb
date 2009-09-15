class CreateFlowlogs < ActiveRecord::Migration
  def self.up
    create_table :flowlogs do |t|
      t.column :workflow_id, :integer
      t.column :flowstep_id, :integer
      t.column :user_id, :integer
      t.column :wenjian_id, :integer
      t.column :desc, :text
      t.timestamps
    end
  end

  def self.down
    drop_table :flowlogs
  end
end
