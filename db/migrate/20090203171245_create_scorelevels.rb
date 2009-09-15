class CreateScorelevels < ActiveRecord::Migration
  def self.up
    create_table :scorelevels do |t|
      t.column :levelname, :string
      t.column :levelvalue, :integer
      t.column :scoretype_id, :integer
      t.timestamps
    end
  end

  def self.down
    drop_table :scorelevels
  end
end
