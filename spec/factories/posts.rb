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

    after(:create) do |post|
      post.plaza = create(:plaza_post, postitable_id: post.id, postitable_type: "post")
    end    
  end
end
