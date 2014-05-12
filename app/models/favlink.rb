# == Schema Information
#
# Table name: favlinks
#
#  id            :integer          not null, primary key
#  title         :string(255)      not null
#  description   :text
#  linkurl       :string(255)      not null
#  writer_id     :integer
#  shared        :boolean          default(TRUE)
#  bundlelink_id :integer
#  created_at    :datetime
#  updated_at    :datetime
#

class Favlink < ActiveRecord::Base
  belongs_to :writer, class_name: 'User'
  belongs_to :bundlelink

  validates :title, presence: true
  validates :writer_id, presence: true
  validates :linkurl, presence: true
  validates :linkurl,
            :format => {:with => URI::regexp,
            :message => 'Incorrect URL format!'}
end
