require 'spec_helper'

describe QuestionsController do

  let(:question) { create(:question) }
  let(:valid_attributes) { attributes_for(:question) }
  let(:invalid_attributes) { attributes_for(:question, title: nil) }

  describe 'GET #index' do
    it "> 모든 Question으로 instance 변수를 할당한다." do
      questions = [question, create(:question)]
      get :index
      expect(assigns(:questions)).to match_array(questions)
    end
  end

  describe 'GET #show' do
    it "> 요청한 Question으로 instance 변수를 할당한다." do
      get :show, id: question
      expect(assigns(:question)).to eq question
    end
  end

  describe 'POST #create' do
    context "1) params가 유효할 때" do
      it "> 새로운 question을 생성한다." do
        expect {
          post :create, question: valid_attributes
        }.to change(Question, :count).by(1)
      end

      it "> 새로운 question으로 instance 변수를 할당한다." do
        post :create, question: valid_attributes
        expect(assigns(:question)).to be_a(Question)
        expect(assigns(:question)).to_not be_new_record
      end
    end

    context "2) params가 유효하지 않을 때" do
      it "> 새로운 quesiton을 생성하지 않는다." do
        expect {
          post :create, question: invalid_attributes
        }.to_not change(Question, :count)
      end

      it "> 새로운 question을 instance 변수에 할당한다." do
        post :create, question: invalid_attributes
        expect(assigns(:question)).to be_a(Question)
        expect(assigns(:question)).to be_new_record
      end
    end
  end

  describe 'PATCH #update' do
    context "1) params가 유효할 때" do
      it "> 요청한 question을 업데이트한다." do
        patch :update, id: question, question: attributes_for(:question, title: "Wonderfulday isn't it?", content: "Yes!!!")
        question.reload
        expect(question.title).to eq("Wonderfulday isn't it?")
        expect(question.content).to eq("Yes!!!")
      end

      it "> 요청한 question을 instance 변수에 할당한다." do
        patch :update, id: question, question: valid_attributes
        question.reload
        expect(assigns(:question)).to eq question
      end
    end

    context "2) params가 유효하지 않을 때" do
      it "> 요청한 quesiton을 업데이트하지 않는다." do
        patch :update, id: question, question: invalid_attributes
        question.reload
        expect(question.title).to eq("Question Title")
        expect(question.content).to eq("Question Content")
      end

      it "> 요청한 question을 instance 변수에 할당한다." do
        patch :update, id: question, question: invalid_attributes
        question.reload
        expect(assigns(:question)).to eq question
      end
    end
    
  end

  describe 'DELETE #destroy' do
    it "> 요청한 question을 삭제한다." do
      question
      expect {
        delete :destroy, id: question
      }.to change(Question, :count).by(-1)
    end
  end

end
