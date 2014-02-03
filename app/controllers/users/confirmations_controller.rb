class Users::ConfirmationsController < Devise::ConfirmationsController

  def show
    self.resource = resource_class.confirm_by_token(params[:confirmation_token])
    yield resource if block_given?

    if resource.errors.empty?
      # set_flash_message(:notice, :confirmed) if is_flashing_format?
      # respond_with_navigational(resource){ redirect_to after_confirmation_path_for(resource_name, resource) }

      render json: { message: I18n.t("devise.confirmations.confirmed")}
    else
      # respond_with_navigational(resource.errors, :status => :unprocessable_entity){ render :new }
      render json: { message: resource.errors, :status => :unprocessable_entity}
    end
  end

end