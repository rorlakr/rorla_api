# == Schema Information
#
# Table name: bundlelinks
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text
#  writer_id   :integer
#  shared      :boolean          default(TRUE)
#  created_at  :datetime
#  updated_at  :datetime
#

class Bundlelink < ActiveRecord::Base
  belongs_to :writer, class_name: 'User'
  has_many :favlinks, dependent: :nullify

  validates :title, presence: true
  validates :writer_id, presence: true
end
