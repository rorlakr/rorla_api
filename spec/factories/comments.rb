# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl


FactoryGirl.define do
  factory :comment do
    content "abc edf"
    factory :comment_to_post do
      commentable { |a| a.association(:post)}
    end
    factory :comment_to_question do
      commentable { |a| a.association(:question)}
    end
    factory :comment_to_answer do
      commentable { |a| a.association(:answer)}
    end
    
  end
  # factory :comment do
  #   content "edf"
  #   factory :comment_to_question do
  #     commentable { |a| a.association(:question)}
  #   end
  # end

end

# FactoryGirl.define do	
#   factory :comment_to_post, class: "comment" do
#     content "abc edf"

#     association :commentable, :factory => :post
#     commentable_type 'post'
#   end
#   factory :comment_to_question, class: "comment" do
#    content "def hij"

#     association :commentable, :factory => :question
#     commentable_type 'question'
#   end  
#   factory :comment_to_answer, class: "comment" do
#    content "hij lmn"

#     association :commentable, :factory => :answer
#     commentable_type 'answer'
#   end    
# end
