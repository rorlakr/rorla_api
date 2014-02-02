class ApplicationController < ActionController::API

  # To resolve the following error: ActionController::UnknownFormat
  include ActionController::StrongParameters

  # To resolve the following error: undefined method `respond_to'
  # http://railscasts.com/episodes/348-the-rails-api-gem?language=ko&view=asciicast
  include ActionController::MimeResponds

  # To resolve the following error: undefined method `default_render'
  # https://github.com/rails-api/rails-api/issues/93
  include ActionController::ImplicitRender

  # To make view helper methods available in Rails API
  include CursorPagination::ActionViewHelper

  # To enable authorize methods in controller
  # Ref. https://github.com/nathanl/authority/issues/64
  include Authority::Controller

  before_filter :authenticate_user_from_token!
  before_filter :authenticate_user!

  # 컨트롤러 액션을 직접 액세스할 때 권한이 없으면 Security Violation 예외를 발생시킨다.
  def authority_forbidden(error)
    Authority.logger.warn(error.message)
    render_error 'FORBIDDEN', '프로젝트 접근권한이 없습니다.', :forbidden
  end

  private

  def render_error(code = 'ERROR', message = '', status = 400)
    render json: {
      error: {
        code: code,
        message: message
      }
    }, :status => status
  end

  # Request Header의 auth token을 이용한 authentication
  # 모든 요청전에 처리함
  # X-Auth-Email : email
  # X-Auth-Token : auth token
  def authenticate_user_from_token!
    user_email = request.headers["X-Auth-Email"].presence
    user       = user_email && User.find_by_email(user_email)

    if user
      if ENV["RAILS_ENV"] == "development"
        sign_in user, store: false
      else
        auth_token = user.auth_tokens.where(token: request.headers["X-Auth-Token"]).first
        if auth_token
          auth_token.touch
          sign_in user, store: false
        end
      end
    end
  end

end
