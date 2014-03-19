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
      question.plaza = FactoryGirl.create(:question_plaza, postitable_id: question.id, postitable_type: "question")
    end        

    factory :question_with_answers do
      ignore do
        answers_count 1
      end

      after(:create) do |question, evaluator|
        create_list(:answer, evaluator.answers_count, question: question)
      end

    end

  end
end
