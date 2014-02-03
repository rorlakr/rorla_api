class Users::SessionsController < Devise::SessionsController
  prepend_before_filter :require_no_authentication, :only => [:create]
  skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }
  include Devise::Controllers::Helpers
  respond_to :json

  def create
    if !params[:email].nil? && !params[:password].nil?
      resource = User.find_for_database_authentication(:email => params[:email])
      return invalid_login_attempt unless resource.present? && (resource.valid_password? params[:password])
    else
      return invalid_login_attempt
    end

    sign_in(:user, resource)

    token = resource.generate_auth_token!

    render :json => {
      id: resource.id,
      email: resource.email,
      auth_token: token
    }
  end

  def destroy
    resource.reset_authentication_token
    Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
    render :status => 200, :json => {}
  end

  def failure
    return render json: { success: false, errors: ["invalid login"] }, :status => :unauthorized
  end

  protected

  def invalid_login_attempt
    render json: {
      error: {
        code: "INVALID_LOGIN",
        message: "Invalid email or password"
      }
    }, :status => :unauthorized
  end

end
