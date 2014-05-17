# == Schema Information
#
# Table name: answers
#
#  id          :integer          not null, primary key
#  content     :text
#  created_at  :datetime
#  updated_at  :datetime
#  question_id :integer
#  user_id     :integer
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :answer do
    content "Answer Content"
  end
end
