# == Schema Information
#
# Table name: plazas
#
#  id              :integer          not null, primary key
#  postitable_id   :integer
#  postitable_type :string(255)
#  visible         :boolean
#  created_at      :datetime
#  updated_at      :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :plaza_post, class: "plaza" do
    association :postitable, :factory => :post
    postitable_type 'post'
    visible false
  end
  factory :plaza_question, class: "plaza" do
    association :postitable, :factory => :question
    postitable_type 'question'
    visible false
  end  
  factory :plaza_event, class: "plaza" do
    association :postitable, :factory => :event
    postitable_type 'event'
    visible false
  end    
end
