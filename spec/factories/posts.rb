# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  title      :string(255)
#  content    :text
#  writer_id  :integer
#  published  :boolean          default(FALSE)
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do

    title "title"
    content "content"

    factory :invalid_post_by_min_title do
    	title Faker::Lorem.characters(2)
    end
    factory :invalid_post_by_max_title do
    	title Faker::Lorem.characters(256)
    end    
    factory :invalid_post_by_max_content do
    	content Faker::Lorem.characters(10001)
    end        
    # app/models.post.rb에 after_create 선언 해주었습니다.
    # after(:create) do |post|
    #   post.plaza = create(:plaza_post, postitable_id: post.id, postitable_type: "post")
    # end    
  end
end
