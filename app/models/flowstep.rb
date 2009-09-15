class Flowstep < ActiveRecord::Base
  belongs_to :workflow
  belongs_to :user
end
