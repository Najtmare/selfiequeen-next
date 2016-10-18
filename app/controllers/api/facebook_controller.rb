class Api::FacebookController < Api::ApiController

  def create
    @user = User.find_or_create_from_facebook(auth_hash_params)

    if @user
      @client_id = SecureRandom.urlsafe_base64(nil, false)
      @token     = SecureRandom.urlsafe_base64(nil, false)

      @user.tokens[@client_id] = {
        token: BCrypt::Password.create(@token),
        expiry: (Time.now + DeviseTokenAuth.token_lifespan).to_i
      }

      @user.save
      new_auth_header = @user.build_auth_header(@token, @client_id)
      response.headers.merge!(new_auth_header)

      sign_in(:user, @user, store: false, bypass: false)

      render json: @user
    end
  end

  def auth_hash_params
    params.permit(:facebook_id, :email, :name, :bio)
  end
end