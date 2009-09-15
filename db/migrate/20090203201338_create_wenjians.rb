class CreateWenjians < ActiveRecord::Migration
  def self.up
    create_table :wenjians do |t|
      t.column :title, :string
      t.column :content, :text
      t.column :user_id, :string
      t.column :workflow_id, :integer
      t.column :flowstep_id, :integer
      t.column :flag, :integer
      t.timestamps
    end
  end

  def self.down
    drop_table :wenjians
  end
end
