require 'spec_helper'

describe <%= controller_class %> do

  let(:<%= model_name %>) { create(:<%= model_name %>) }
  let(:valid_attributes) { attributes_for(:<%= model_name %>) }
  let(:update_attributes) { }
  let(:invalid_attributes) { }

  describe 'GET #index' do
    it "> 모든 <%= model_name %>(으)로 instance 변수를 할당한다." do
      <%= model_name %>s = [<%= model_name %>, create(:<%= model_name %>)]
      get :index
      expect(assigns(:<%= model_name %>s)).to match_array(<%= model_name %>s)
    end
  end

  describe 'GET #show' do
    it "> 요청한 <%= model_name %>(으)로 instance 변수를 할당한다." do
      get :show, id: <%= model_name %>
      expect(assigns(:<%= model_name %>)).to eq <%= model_name %>
    end
  end

  describe 'POST #create' do
    context "1) params가 유효할 때" do
      it "> 새로운 <%= model_name %>(을)를 생성한다." do
        expect{
          post :create, <%= model_name %>: valid_attributes
        }.to change(<%= model_class %>, :count).by(1)
      end

      it "> 새로운 <%= model_name %>(으)로 instance 변수를 할당한다." do
        post :create, <%= model_name %>: valid_attributes
        expect(assigns(:<%= model_name %>)).to be_a(<%= model_class %>)
        expect(assigns(:<%= model_name %>)).to_not be_new_record
      end
    end

    context "2) params가 유효하지 않을 때" do
      it "> 새로운 <%= model_name %>(을)를 생성하지 않는다." do
        expect{
          post :create, <%= model_name %>: valid_attributes 
        }.to change(<%= model_class %>, :count)
      end

      it "> 새로운 <%= model_name %>(으)로 instance 변수를 할당한다." do
        post :create, <%= model_name %>: invalid_attributes 
        expect(assigns(:<%= model_name %>)).to be_a(<%= model_class %>)
        expect(assigns(:<%= model_name %>)).to be_new_record
      end
    end
  end

  describe 'PUT #update' do
    context "1) params가 유효할 때" do
      it "> 요청한 <%= model_name %>(을)를 업데이트한다." do
        put :update, id: <%= model_name %>, <%= model_name %>: update_attributes
        <%= model_name %>.reload
        expect(<%= model_name %>).to eq <%= model_name %>
      end

      it "> 요청한 <%= model_name %>(으)로 instance 변수를 할당한다." do
        patch :update, id: <%= model_name %>, <%= model_name %>: update_attributes
        <%= model_name %>.reload
        expect(assigns(:<%= model_name %>)).to eq <%= model_name %>
      end
    end

    context "2) params가 유효하지 않을 때" do
      it "> 요청한 <%= model_name %>(을)를 업데이트하지 않는다."

      it "> 요청한 <%= model_name %>(으)로 instance 변수를 할당한다." do
        patch :update, id: <%= model_name %>, <%= model_name %>: invalid_attributes 
        <%= model_name %>.reload
        expect(assigns(:<%= model_name %>)).to eq <%= model_name %>
      end
    end
  end

  describe 'DELETE #destroy' do
    it "> 요청한 <%= model_name %>(을)를 삭제한다." do
      <%= model_name %>
      expect {
        delete :destroy, id: <%= model_name %>
      }.to change(<%= model_class %>, :count).by(-1)
    end
  end

end