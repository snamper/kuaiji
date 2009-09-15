class Shouwen < ActiveRecord::Base
  belongs_to :user, :foreign_key => "receive_user_id"
end
