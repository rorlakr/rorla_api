module TokenAuthenticatable
  extend ActiveSupport::Concern

  def generate_auth_token!
    token = nil

    loop do
      token = Devise.friendly_token
      break token unless self.auth_tokens.where(token: token).first
    end

    AuthToken.create({user_id:self.id, token:token})

    token
  end
end