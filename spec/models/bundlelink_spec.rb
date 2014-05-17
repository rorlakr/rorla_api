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

require 'spec_helper'

describe Bundlelink do
  describe '> 모델 객체의 생성' do
    it '> 유효한 데이터로 생성한 Post 객체는 유효하다.' do
      expect(create(:bundlelink)).to be_valid
    end
  end
  describe '> 유효성 검증' do
    it '> Title이 없으면 유효하지 않다.' do
      expect(build(:bundlelink)).to validate_presence_of :title
    end
    it '> writer_id 속성은 필수항목이다.' do
      expect(build(:bundlelink)).to validate_presence_of :writer_id
    end
    it '> shared 속성의 기본값은 true이다' do
      expect(build(:bundlelink).shared).to be_true
    end
  end
  describe '> 관계선언 검증' do
    it '> has_many :favlinks, dependent: :nullify' do
      expect(create(:bundlelink)).to have_many(:favlinks).dependent(:nullify)
    end
  end
end

