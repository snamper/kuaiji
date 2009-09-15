class User < ActiveRecord::Base
  belongs_to :group

  def self.authenticate(name, password)
    user = self.find_by_name(name)
    if user
      if user.password != password
        user = nil
      end
    end
    user
  end
end
