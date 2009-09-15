class CreateScores < ActiveRecord::Migration
  def self.up
    create_table :scores do |t|
      t.column :lunwen_id, :integer
      t.column :total_value, :integer
      t.timestamps
    end
  end

  def self.down
    drop_table :scores
  end
end
