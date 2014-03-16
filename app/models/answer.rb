class Answer < ActiveRecord::Base
  validates_presence_of :content
end
