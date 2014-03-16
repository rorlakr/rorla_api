class Question < ActiveRecord::Base
  validates_presence_of :title, :content

  has_many :answers
  
end
