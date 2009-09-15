class Score < ActiveRecord::Base
  belongs_to :lunwen
  belongs_to :user
end
