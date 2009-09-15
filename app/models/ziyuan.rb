class Ziyuan < ActiveRecord::Base
  acts_as_tree :order => "seq"
  has_and_belongs_to_many :groups
end
