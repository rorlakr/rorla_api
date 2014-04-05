# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#

class Comment < ActiveRecord::Base

	validates_presence_of :content
	validates :title, presence: true, :length => { :minimum => 3, :maximum => 255 }
	validates :content, presence: true, :length => { :minimum => 0, :maximum => 10000 }

end
