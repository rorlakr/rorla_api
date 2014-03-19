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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    name "제57회 ROR Lab."
    start_time "2014-03-18 20:00:00"
    end_time "2014-03-18 22:00:00"
    location "강남 토즈 2호점"
    fb_event_id "1449827871917192"
    description "제1교시 : Form Helpers (5) (정창훈)\n제2교시 : Debugging Rails Applications (1) (남승균)\n\n* NAVER 개발자 지원 프로그램\n* 강남 토즈2호점에 예약되어있습니다. 예약한 모임명은 \"NAVER개발자커뮤니티지원_RORLab_57회\" 입니다."
    latitude 37.5033250584
    longitude 127.024916778

    after(:create) do |event|
      event.plaza = FactoryGirl.create(:post_plaza, postitable_id: event.id, postitable_type: "event")
    end      
  end
end
