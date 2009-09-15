class CreateShouwens < ActiveRecord::Migration
  def self.up
    create_table :shouwens do |t|
      t.column :title, :string
      t.column :content, :text
      t.column :status, :integer
      t.column :user_id, :integer
      t.column :receive_user_id, :integer
      t.timestamps
    end
  end

  def self.down
    drop_table :shouwens
  end
end
