# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :plaza do
    postit_id 1
    postit_type "MyString"
    visible false
  end
end
