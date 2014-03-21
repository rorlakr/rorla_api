# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  title      :string(255)
#  content    :text
#  writer_id  :integer
#  published  :boolean          default(FALSE)
#

require 'spec_helper'

describe Post do
  describe "> Post모델 객체의 생성" do
    it "> 유효한 데이터로 생성한 Post 객체는 유효하다." do
      expect(create(:post)).to be_valid
    end
  end
  describe "> 유효성 검증" do
    it "> Title이 없으면 유효하지 않다." do
      expect(build(:post)).to validate_presence_of :title
    end
    it "> Content가 없으면 유효하지 않다." do
      expect(build(:post)).to validate_presence_of :content
    end
    it "> Post 생성시 hit의 기본값은 0이다." do
      expect(build(:post).hit).to eq(0)
    end
  end
  describe "> 관계선언 검증" do
    it "> 4개의 Comment를 가지고 있다."
  end
end
