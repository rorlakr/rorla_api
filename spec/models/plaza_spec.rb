# == Schema Information
#
# Table name: plazas
#
#  id              :integer          not null, primary key
#  postitable_id   :integer
#  postitable_type :string(255)
#  visible         :boolean
#  created_at      :datetime
#  updated_at      :datetime
#

require 'spec_helper'

describe Plaza do
  describe "모델 객체의 생성" do
    it "> Post 객체를 유효한 데이터로 생성시 Plaza에 추가된다." do
      post = create(:post)      
      expect(post.plaza).to be_valid
    end
    it "> Question 객체를 유효한 데이터로 생성시 Plaza에 추가된다." do
      question = create(:question)      
      expect(question.plaza).to be_valid
    end    
    it "> Event 객체를 유효한 데이터로 생성시 Plaza에 추가된다." do
      event = create(:event)      
      expect(event.plaza).to be_valid
    end       
  end
  describe "유효성 검증"
  describe "관계선언 검증"
  describe "스코프 및 클래스 메소드 검증"
  describe "인스턴스 메소드 검증"
end
