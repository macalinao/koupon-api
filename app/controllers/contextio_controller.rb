class ContextioController < ApplicationController

  def auth
    redirect_to(Context.auth_url)
  end

  def callback
    token = params[:contextio_token]
    user = Context.create_user(token)
    if user.blank?
      render status: 401, json: {
        error: "Invalid token"
      }
    else
      render json: {
        token: user.token
      }
    end
  end

end
