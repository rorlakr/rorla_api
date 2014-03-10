# == Schema Information
#
# Table name: plazas
#
#  id            :integer          not null, primary key
#  plazable_id   :integer
#  plazable_type :string(255)
#  visible       :boolean
#  created_at    :datetime
#  updated_at    :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post_plaza, class: "plaza" do
    association :plazable, :factory => :post
    plazable_type 'post'
    visible false
  end
  factory :question_plaza, class: "plaza" do
    association :plazable, :factory => :question
    plazable_type 'question'
    visible false
  end  
end
