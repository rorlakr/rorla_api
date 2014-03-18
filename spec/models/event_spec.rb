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

require 'spec_helper'

describe Event do
  describe "모델 객체의 생성" do
    it "> 유효한 데이터로 생성한 Event 객체는 유효하다." do
      expect(create(:event)).to be_valid
    end
  end
  describe "유효성 검증" do
      it "> Name이 없으면 유효하지 않다." do
      expect(create(:event)).to validate_presence_of :name
    end
  end
  describe "관계선언 검증"
  describe "스코프 및 클래스 메소드 검증"
  describe "인스턴스 메소드 검증"
end
