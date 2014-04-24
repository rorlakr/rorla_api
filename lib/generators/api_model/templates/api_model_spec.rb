require 'spec_helper'

describe <%= model_class %> do
  describe "모델 객체의 생성" do
    it "> 생성한 <%= model_class %> 객체는 유효하다." do
      expect(create(:<%= model_name %>)).to be_valid
    end
  end

  describe "유효성 검증" do
    it "> "
  end

  describe "관계선언 검증" do
    it "> "
  end

  describe "스코프 및 클래스 메소드 검증" do
    it "> "
  end

  describe "인스턴스 메소드 검증" do
    it "> "
  end

end
