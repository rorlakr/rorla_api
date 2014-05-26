require 'spec_helper'

describe QuestionsController do

  let(:question) { create(:question) }
  let(:valid_attributes) { attributes_for(:question) }
  let(:invalid_attributes) { attributes_for(:question, title: nil) }

  describe 'User 로그인' do
    context "> 로그인 상태" do
      before :each do
        current_user = create(:user)
        current_user.confirm!
        sign_in current_user
      end

      describe 'GET #index' do
        it "> 모든 Question으로 instance 변수를 할당한다." do
          questions = [question, create(:question)]
          do_index
          expect(assigns(:questions)).to match_array(questions)
        end
      end

      describe 'GET #show' do
        it "> 요청한 Question으로 instance 변수를 할당한다." do
          do_show
          expect(assigns(:question)).to eq question
        end
      end

      describe 'POST #create' do
        context "1) params가 유효할 때" do
          it "> 새로운 Question을 생성한다." do
            expect {
              do_post(valid_attributes)
            }.to change(Question, :count).by(1)
          end

          it "> 새로운 Question으로 instance 변수를 할당한다." do
            do_post(valid_attributes)
            expect(assigns(:question)).to be_a(Question)
            expect(assigns(:question)).to_not be_new_record
          end
        end

        context "2) params가 유효하지 않을 때" do
          it "> 새로운 Quesiton을 생성하지 않는다." do
            expect {
              do_post(invalid_attributes)
            }.to_not change(Question, :count)
          end

          it "> 새로운 Question을 instance 변수에 할당한다." do
            do_post(invalid_attributes)
            expect(assigns(:question)).to be_a(Question)
            expect(assigns(:question)).to be_new_record
          end
        end
      end

      describe 'PATCH #update' do
        context "1) params가 유효할 때" do
          it "> 요청한 question을 업데이트한다." do
            do_patch(attributes_for(:question, title: "Wonderfulday isn't it?", content: "Yes!!!"))
            expect(question.title).to eq("Wonderfulday isn't it?")
            expect(question.content).to eq("Yes!!!")
          end

          it "> 요청한 question을 instance 변수에 할당한다." do
            do_patch(attributes_for(:question, title: "Wonderfulday isn't it?", content: "Yes!!!"))
            expect(assigns(:question)).to eq question
          end
        end

        context "2) params가 유효하지 않을 때" do
          it "> 요청한 quesiton을 업데이트하지 않는다." do
            do_patch(invalid_attributes)
            expect(question.title).to eq("Question Title")
            expect(question.content).to eq("Question Content")
          end

          it "> 요청한 question을 instance 변수에 할당한다." do
            do_patch(invalid_attributes)
            expect(assigns(:question)).to eq question
          end
        end
      end

      describe 'DELETE #destroy' do
        before(:each) { question }

        it "> 요청한 Question을 삭제한다." do
          expect {
            do_delete
          }.to change(Question, :count).by(-1)
        end

        it "> 요청한 Question으로 instance 변수를 할당한다." do
          do_delete
          expect(assigns(:question)).to eq question
        end
      end
    end

    context "> 비로그인 상태" do
      describe 'GET #index' do
        it "> 상태 코드 401(권한 없음)을 할당한다." do
          do_index
          expect(response.status).to be 401
        end
      end

      describe 'GET #show' do
        it "> 상태 코드 401(권한 없음)을 할당한다." do
          do_show
          expect(response.status).to be 401
        end
      end

      describe 'POST #create' do
        it "> 상태 코드 401(권한 없음)을 할당한다." do
          do_post valid_attributes
          expect(response.status).to be 401
        end
      end

      describe 'PATCH #update' do
        it "> 상태 코드 401(권한 없음)을 할당한다." do
          do_patch valid_attributes
          expect(response.status).to be 401
        end
      end

      describe 'DELETE #destroy' do
        it "> 상태 코드 401(권한 없음)을 할당한다." do
          do_delete
          expect(response.status).to be 401
        end
      end
    end
  end



  private

  def do_index
    get :index, format: :json
  end

  def do_show
    get :show, id: question, format: :json
  end

  def do_post(attributes={})
    post :create, question: attributes, format: :json
  end

  def do_patch(attributes={})
    patch :update, id: question, question: attributes, format: :json
    question.reload
  end
  
  def do_delete
    delete :destroy, id: question, format: :json
  end

end
