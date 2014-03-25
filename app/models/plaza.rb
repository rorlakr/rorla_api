# == Schema Information
#
# Table name: plazas
#
#  id              :integer          not null, primary key
#  postitable_id   :integer
#  postitable_type :string(255)
#  visible         :boolean
#  created_at      :datetime
#  updated_at      :datetime
#

class Plaza < ActiveRecord::Base
  belongs_to :postitable, polymorphic: true
end
