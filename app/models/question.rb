# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  content    :text
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#

class Question < ActiveRecord::Base
  after_create :set_plaza_question

  has_one :plaza, :as => :postitable, :dependent => :destroy
  has_many :comments, :as => :commentable, :dependent => :destroy

  has_many :answers, dependent: :destroy

  validates_presence_of :title, :content

  private
    def set_plaza_question
      self.create_plaza
    end

end
