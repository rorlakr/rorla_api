# == Schema Information
#
# Table name: events
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  start_time   :datetime
#  end_time     :datetime
#  location     :string(255)
#  fb_event_id  :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#  description  :text
#  latitude     :decimal(10, 6)
#  longitude    :decimal(10, 6)
#  updated_time :datetime
#  material     :text
#  modifiable   :boolean          default(FALSE)
#

class Event < ActiveRecord::Base
    has_one :plaza, :as => :postitable, :dependent => :destroy

    validates_presence_of :name, :start_time, :end_time, :location, :fb_event_id, :latitude, :longitude

end
