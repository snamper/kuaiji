class Workflow < ActiveRecord::Base
  has_many :flowsteps
  belongs_to :user
end
