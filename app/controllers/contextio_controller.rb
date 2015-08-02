class ContextioController < ApplicationController

  def auth
    redirect_to(Context.auth_url)
  end

  def callback
    token = params[:contextio_token]
    user = Context.create_user(token)
    render json: {
      token: user.token
    }
  end

end
