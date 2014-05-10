# == Schema Information
#
# Table name: answers
#
#  id          :integer          not null, primary key
#  content     :text
#  created_at  :datetime
#  updated_at  :datetime
#  question_id :integer
#  user_id     :integer
#

require 'spec_helper'

describe Answer do
  describe "모델 객체의 생성" do
    it "> 생성한 Answer 객체는 유효하다." do
      expect(build(:answer)).to be_valid
    end
  end

  describe "유효성 검증" do
    it "> content가 없으면 유효하지 않다." do
      expect(create(:answer)).to validate_presence_of :content
    end
  end

  describe "관계선언 검증"
  describe "스코프 및 클래스 메소드 검증"
  describe "인스턴스 메소드 검증"
end
