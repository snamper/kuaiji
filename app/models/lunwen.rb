class Lunwen < ActiveRecord::Base
  belongs_to :lwcategory
  belongs_to :tjdanwei
  has_many :scores
end
