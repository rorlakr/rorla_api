# == Schema Information
#
# Table name: plazas
#
#  id            :integer          not null, primary key
#  postitable_id   :integer
#  postitable_type :string(255)
#  visible       :boolean
#  created_at    :datetime
#  updated_at    :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post_plaza, class: "plaza" do
    association :postitable, :factory => :post
    postitable_type 'post'
    visible false
  end
  factory :question_plaza, class: "plaza" do
    association :postitable, :factory => :question
    postitable_type 'question'
    visible false
  end  
end
