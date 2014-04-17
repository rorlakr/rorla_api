require 'spec_helper'

describe AnswersController do

  let(:answer) { create(:answer) }
  let(:valid_attributes) { attributes_for(:answer) } 
  let(:invalid_attributes) { attributes_for(:answer, content: nil) }

  describe 'GET #index' do
    it "> 모든 Answer로 instance 변수를 할당한다." do
      answers = [answer, create(:answer)]
      get :index
      expect(assigns(:answers)).to match_array(answers)
    end
  end

  describe 'GET #show' do
    it "> 요청한 Answer로 instance 변수를 할당한다." do
      get :show, id: answer
      expect(assigns(:answer)).to eq answer
    end
  end

  describe 'POST #create' do
    context "1) params가 유효할 때" do
      it "> 새로운 answer를 생성한다." do
        expect{
          post :create, answer: valid_attributes
        }.to change(Answer, :count).by(1)
      end

      it "> 새로운 answer로 instance 변수를 할당한다." do
        post :create, answer: valid_attributes
        expect(assigns(:answer)).to be_a(Answer)
        expect(assigns(:answer)).to_not be_new_record
      end
    end

    context "2) params가 유효하지 않을 때" do
      it "> 새로운 answer를 생성하지 않는다." do
        expect{
          post :create, answer: valid_attributes 
        }.to change(Answer, :count)
      end

      it "> 새로운 answer로 instance 변수를 할당한다." do
        post :create, answer: invalid_attributes 
          expect(assigns(:answer)).to be_a(Answer)
          expect(assigns(:answer)).to be_new_record
      end
    end
  end

  describe 'PATCH #update' do
    context "1) params가 유효할 때" do
      it "> 요청한 answer를 업데이트한다." do
        patch :update, id: answer, answer: attributes_for(:answer, content: "Answer content changed")
	      answer.reload
        expect(answer.content).to eq "Answer content changed"
      end
      
      it "> 요청한 answer로 instance 변수를 할당한다." do
        patch :update, id: answer, answer: attributes_for(:answer, content: "Answer content changed")
        answer.reload
        expect(assigns(:answer)).to eq answer
      end
    end

    context "2) params가 유효하지 않을 때" do
      it "> 요청한 answer를 업데이트하지 않는다." do
        patch :update, id: answer, answer: invalid_attributes 
        answer.reload
        expect(answer.content).to eq "Answer Content"
      end

      it "> 요청한 answer로 instance 변수를 할당한다." do
        patch :update, id: answer, answer: invalid_attributes 
        answer.reload
        expect(assigns(:answer)).to eq answer
      end
    end
  end

  describe 'DELETE #destroy' do
    it "> 요청한 answer를 삭제한다." do
      answer
      expect {
        delete :destroy, id: answer
      }.to change(Answer, :count).by(-1)
    end
  end

end
