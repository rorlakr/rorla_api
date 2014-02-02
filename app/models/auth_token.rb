class AuthToken < ActiveRecord::Base
  belongs_to :user
end
