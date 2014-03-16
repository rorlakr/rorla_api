require 'spec_helper'

describe Question do
  describe "모델 객체의 생성" do
    it "> 생성한 Question 객체는 유효하다." do
      expect(create(:question)).to be_valid
    end
  end

  describe "유효성 검증" do
    it "> title이 없으면 유효하지 않다." do
      expect(create(:question)).to validate_presence_of :title
    end

    it "> content가 없으면 유효하지 않다." do
      expect(create(:question)).to validate_presence_of :content
    end
  end

  describe "관계선언 검증" do
    it "> answer를 가질 수 있다." do
      expect(create(:question_with_answers).answers.first).to be_valid
    end

    it "> 다수의 answer를 가질 수 있다." do
      expect(create(:question_with_answers, answers_count: 5).answers.count).to eq 5
    end

  end
  describe "스코프 및 클래스 메소드 검증"
  describe "인스턴스 메소드 검증"
end
