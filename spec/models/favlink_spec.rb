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

require 'spec_helper'

describe Favlink do
  describe '> 모델 객체의 생성' do
    it '> 유효한 데이터로 생성한 Post 객체는 유효하다.' do
      expect(create(:favlink)).to be_valid
    end
  end
  describe '> 유효성 검증' do
    it '> Title이 없으면 유효하지 않다.' do
      expect(build(:favlink)).to validate_presence_of :title
    end
    it '> writer_id 속성은 필수항목이다.' do
      expect(build(:favlink)).to validate_presence_of :writer_id
    end
    it '> linkurl 속성은 필수항목이다.' do
      expect(build(:favlink)).to validate_presence_of :linkurl
    end
    it '> linkurl 속성은 url 형식을 가져야 한다.' do
      favlink = build(:favlink)
      expect(favlink).to allow_value(favlink.linkurl).for(:linkurl)
    end
    it '> shared 속성의 기본값은 true이다' do
      expect(build(:favlink).shared).to be_true
    end
  end
  describe '> 관계선언 검증' do
    it '> belongs_to :bundlelink' do
      expect(create(:favlink)).to belong_to(:bundlelink)
    end
  end
end
