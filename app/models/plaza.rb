# == Schema Information
#
# Table name: plazas
#
#  id            :integer          not null, primary key
#  plazable_id   :integer
#  plazable_type :string(255)
#  visible       :boolean
#  created_at    :datetime
#  updated_at    :datetime
#

class Plaza < ActiveRecord::Base
  belongs_to :plazable, polymorphic: true
end
