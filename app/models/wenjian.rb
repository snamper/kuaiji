class Wenjian < ActiveRecord::Base
  belongs_to :workflow
  belongs_to :flowstep
end
