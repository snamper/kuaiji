class CreateFlowsteps < ActiveRecord::Migration
  def self.up
    create_table :flowsteps do |t|
      t.column :name, :string
      t.column :desc, :text
      t.column :workflow_id, :integer
      t.column :seq, :integer
      t.column :endflag, :integer
      t.timestamps
    end
  end

  def self.down
    drop_table :flowsteps
  end
end
