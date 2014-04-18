class <%= controller_class %> < ApplicationController

  before_action :set_<%= model_name %>, only: [:show, :update, :destroy]

  def index
    @<%= model_name %>s = <%= model_class %>.all
    render json: @<%= model_name %>s
  end

  def show
    render json: @<%= model_name %>
  end

  def create
    @<%= model_name %> = <%= model_class %>.create(<%= model_name %>_params)
    render json: @<%= model_name %>
  end

  def update
    @<%= model_name %>.update(<%= model_name %>_params)
    render json: @<%= model_name %>
  end

  def destroy
    @<%= model_name %>.destroy
    render json: { message: "destoryed" }
  end

  private

  def set_<%= model_name %>
    @<%= model_name %> = <%= model_class %>.find(params[:id])
  end

  def <%= model_name %>_params
    params.require(:<%= model_name %>).permit()
  end
end
