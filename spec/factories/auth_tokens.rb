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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :auth_token do
    user nil
    token "MyString"
  end
end
