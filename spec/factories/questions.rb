# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :question do
    title "Question title"
    content "Question Content"

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
