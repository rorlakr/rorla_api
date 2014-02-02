# == Schema Information
#
# Table name: auth_tokens
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  token      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class AuthToken < ActiveRecord::Base
  belongs_to :user

  # validation
  validates :user_id, presence: true
  validates :token,   presence: true
end
