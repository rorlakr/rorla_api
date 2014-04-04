require 'spec_helper'

describe QuestionsController do

  describe 'GET #index' do
    it "> 모든 Question을 @questions에 할당한다." do
      question1 = create(:question, title: "Q1")
      question2 = create(:question, title: "Q2")
      get :index
      expect(assigns(:questions)).to match_array([question1, question2])
    end
  end

  describe 'GET #show' do
    it "> 특정 Question을 @question instance에 할당한다." do
      question = create(:question)
      get :show, id: question
      expect(assigns(:question)).to eq question
    end
  end

  describe 'POST #create' do
    context "1) params가 유효할 때" do
      it "> 새로운 question을 생성한다." do
        expect {
          post :create, { question: attributes_for(:question) }
        }.to change(Question, :count).by(1)
      end

      it "> 새로운 question instance에 할당한다." do
        post :create, { question: attributes_for(:question) }
        expect(assigns(:question)).to be_a(Question)
        expect(assigns(:question)).to_not be_new_record
      end
    end

    context "2) params가 유효하지 않을 때" do
      it "> 새로운 quesiton을 생성하지 않는다." do
        expect {
          post :create, { question: attributes_for(:question_invalid) }
        }.to_not change(Question, :count)
      end

      it "> 새로운 question instance에 할당한다." do
        post :create, { question: attributes_for(:question_invalid) }
        expect(assigns(:question)).to be_a(Question)
        expect(assigns(:question)).to be_new_record
      end
    end

  end

  describe 'PATCH #update' do
    context "(params가 유효할 때)" do
      it "> question을 업데이트한다." do
        question = create(:question)
        patch :update, id: question, question: attributes_for(:question, title: "Wonderfulday isn't it?", content: "Yes!!!")
        question.reload
        expect(question.title).to eq("Wonderfulday isn't it?")
        expect(question.content).to eq("Yes!!!")
      end

      it "> 새로운 @question instance에 할당한다." do
        question = create(:question)
        patch :update, id: question, question: attributes_for(:question)
        expect(assigns(:question)).to eq question
      end
    end

    context "(params가 유효하지 않을 때)" do
      it "> quesiton을 업데이트하지 않는다." do
        question = create(:question, title: "Question Title", content: "Question Content")
        patch :update, id: question, question: attributes_for(:question_invalid)
        question.reload
        expect(question.title).to eq("Question Title")
        expect(question.content).to eq("Question Content")
      end
    end
  end

  describe 'DELETE #destroy' do
    it "> question을 삭제한다." do
      question = create(:question)
      expect {
        delete :destroy, id: question
      }.to change(Question, :count).by(-1)
    end
  end

end
