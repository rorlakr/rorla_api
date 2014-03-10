# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  content    :text
#  created_at :datetime
#  updated_at :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :question do
    title "Question title"
    content "Question Content"

    after(:create) do |question|
      question.plaza = FactoryGirl.create(:question_plaza, plazable_id: question.id, plazable_type: "question")
    end        
  end
end
