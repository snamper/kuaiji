class AddScoreUser < ActiveRecord::Migration
  def self.up
    add_column :scores, :user_id, :string
  end

  def self.down
    remove_column :scores, :user_id
  end
end
