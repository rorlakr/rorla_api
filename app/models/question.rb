# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  content    :text
#  created_at :datetime
#  updated_at :datetime
#

class Question < ActiveRecord::Base
  has_one :plaza, :as => :plazable, :dependent => :destroy
  
  validates_presence_of :title, :content
end
