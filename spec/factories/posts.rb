# == Schema Information
#
# Table name: posts
#
#  id           :integer          not null, primary key
#  created_at   :datetime
#  updated_at   :datetime
#  title        :string(255)
#  content      :text
#  writer_id    :integer
#  published    :boolean          default(FALSE)
#  published_at :datetime
#  hit          :integer          default(0)
#  deleted_at   :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do

    title "post title"
    content "post content"
 
    # app/models.post.rb에 after_create 선언 해주었습니다.
    # after(:create) do |post|
    #   post.plaza = create(:plaza_post, postitable_id: post.id, postitable_type: "post")
    # end    
  end
end
