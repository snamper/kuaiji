class AddWorkflowStepNum < ActiveRecord::Migration
  def self.up
    add_column :workflows, :step_num, :integer
  end

  def self.down
    remove_column :workflows, :step_num
  end
end
