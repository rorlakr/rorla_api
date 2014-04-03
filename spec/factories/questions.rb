# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  content    :text
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :question do
    title "Question title"
    content "Question Content"
    
    after(:create) do |question|
      question.plaza = create(:plaza_question, postitable_id: question.id, postitable_type: "question")
    end
    
  end
end
