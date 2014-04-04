require 'spec_helper'

describe QuestionsController do

  describe 'GET #index' do
    it "> 모든 Question을 @questions에 할당한다."
  end

  describe 'GET #show' do
    it "> 특정 Question을 @question instance에 할당한다."
  end

  describe 'POST #create' do
    context "(params가 유효할 때)" do
      it "> 새로운 question을 생성한다."
      it "> 새로운 @question instance에 할당한다."
    end

    context "(params가 유효하지 않을 때)" do
      it "> 새로운 quesiton을 생성하지 않는다."
    end

  end

  describe 'PATCH #update' do
    context "(params가 유효할 때)" do
      it "> question을 업데이트한다."
      it "> 새로운 @question instance에 할당한다."
    end

    context "(params가 유효하지 않을 때)" do
      it "> quesiton을 업데이트하지 않는다."
    end
  end

  describe 'DELETE #destroy' do
    it "> question을 삭제한다."
  end

end
