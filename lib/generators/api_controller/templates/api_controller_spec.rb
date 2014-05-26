require 'spec_helper'

describe <%= controller_class %> do
require 'spec_helper'

  let(:<%= model_name %>) { create(:<%= model_name %>) }
  let(:valid_attributes) { attributes_for(:<%= model_name %>) }
  let(:update_attributes) { }
  let(:invalid_attributes) { }

  describe 'User' do
    context '로그인' do
      before :each do
        current_user = create(:user)
        current_user.confirm!
        sign_in current_user
      end

      describe '> GET #index' do
        it "> 모든 <%= model_class %>으로 instance 변수를 할당한다." do
          <%= model_name %>s = [<%= model_name %>, create(:<%= model_name %>)]
          do_index
          expect(assigns(:<%= model_name %>s)).to match_array(<%= model_name %>s)
        end
      end

      describe '> GET #show' do
        it "> 요청한 <%= model_class %>으로 instance 변수를 할당한다." do
          do_show
          expect(assigns(:<%= model_name %>)).to eq <%= model_name %>
        end
      end

      describe '> POST #create' do
        context "1) params가 유효할 때" do
          it "> 새로운 <%= model_class %>을 생성한다." do
            expect {
              do_post valid_attributes
            }.to change(<%= model_class %>, :count).by(1)
          end

          it "> 새로운 <%= model_class %>으로 instance 변수를 할당한다." do
            do_post valid_attributes
            expect(assigns(:<%= model_name %>)).to be_a(<%= model_class %>)
            expect(assigns(:<%= model_name %>)).to_not be_new_record
          end
        end

        context "2) params가 유효하지 않을 때" do
          it "> 새로운 <%= model_class %>을 생성하지 않는다." do
            expect {
              do_post invalid_attributes
            }.to_not change(<%= model_class %>, :count)
          end

          it "> 새로운 <%= model_class %>을 instance 변수에 할당한다." do
            do_post invalid_attributes
            expect(assigns(:<%= model_name %>)).to be_a(<%= model_class %>)
            expect(assigns(:<%= model_name %>)).to be_new_record
          end
        end
      end

      describe '> PATCH #update' do
        context "1) params가 유효할 때" do
          it "> 요청한 <%= model_name %>을 업데이트한다."

          it "> 요청한 <%= model_name %>을 instance 변수에 할당한다." do
            do_patch update_attributes
            expect(assigns(:<%= model_name %>)).to eq <%= model_name %>
          end
        end

        context "2) params가 유효하지 않을 때" do
          it "> 요청한 <%= model_name %>을 업데이트하지 않는다."

          it "> 요청한 <%= model_name %>을 instance 변수에 할당한다." do
            do_patch invalid_attributes
            expect(assigns(:<%= model_name %>)).to eq <%= model_name %>
          end
        end
      end

      describe '> DELETE #destroy' do
        before(:each) { <%= model_name %> }

        it "> 요청한 <%= model_name %>을 삭제한다." do
          expect {
            do_delete
          }.to change(<%= model_class %>, :count).by(-1)
        end

        it "> 요청한 <%= model_class %>으로 instance 변수를 할당한다." do
          do_delete
          expect(assigns(:<%= model_name %>)).to eq <%= model_name %>
        end
      end
    end

    context "로그아웃" do
      describe '> GET #index' do
        it "> 상태 코드 401(권한 없음)을 할당한다." do
          do_index
          expect(response.status).to be 401
        end
      end

      describe '> GET #show' do
        it "> 상태 코드 401(권한 없음)을 할당한다." do
          do_show
          expect(response.status).to be 401
        end
      end

      describe '> POST #create' do
        it "> 상태 코드 401(권한 없음)을 할당한다." do
          do_post valid_attributes
          expect(response.status).to be 401
        end
      end

      describe '> PATCH #update' do
        it "> 상태 코드 401(권한 없음)을 할당한다." do
          do_patch valid_attributes
          expect(response.status).to be 401
        end
      end

      describe '> DELETE #destroy' do
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
    get :show, id: <%= model_name %>, format: :json
  end

  def do_post(attributes={})
    post :create, <%= model_name %>: attributes, format: :json
  end

  def do_patch(attributes={})
    patch :update, id: <%= model_name %>, <%= model_name %>: attributes, format: :json
    <%= model_name %>.reload
  end
  
  def do_delete
    delete :destroy, id: <%= model_name %>, format: :json
  end

end