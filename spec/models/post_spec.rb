require 'spec_helper'

describe Post do
  describe "> Post모델 객체의 생성" do
    it "> 유효한 데이터로 생성한 Post 객체는 유효하다."
    it "> Title이 없으면 유효하지 않다."
    it "> Content가 없으면 유효하지 않다."
    it "> 4개의 Comment를 가지고 있다."
    it "> Post 생성시 hit는 0이다."
  end
end
