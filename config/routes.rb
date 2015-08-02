Rails.application.routes.draw do

  get '/contextio/auth' => 'contextio#auth'
  get '/contextio/callback' => 'contextio#callback'

end
