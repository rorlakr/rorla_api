# == Schema Information
#
# Table name: answers
#
#  id          :integer          not null, primary key
#  content     :text
#  created_at  :datetime
#  updated_at  :datetime
#  question_id :integer
#  user_id     :integer
#

class Answer < ActiveRecord::Base
  validates_presence_of :content

  has_many :comments, :as => :commentable, :dependent => :destroy

  belongs_to :question
  belongs_to :user
end
