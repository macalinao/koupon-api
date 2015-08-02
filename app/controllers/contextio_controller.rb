class ContextioController < ApplicationController

  def auth
    redirect_to(Context.auth_url)
  end

  def callback
  end

end
