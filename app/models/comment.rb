# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  created_at       :datetime
#  updated_at       :datetime
#  content          :text
#  writer_id        :integer
#  commentable_id   :integer
#  commentable_type :string(255)
#

class Comment < ActiveRecord::Base

  	belongs_to :commentable, :polymorphic => true

	validates_presence_of :content
	validates :content, presence: true, :length => { :minimum => 0, :maximum => 10000 }

end
