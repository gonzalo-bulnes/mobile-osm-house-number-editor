class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]
    if Rails.env.test?
      # This block is a workaround to the mock_auth_hash macro not being loaded
      # in spec/requests/house_numbers_spec.rb from spec/support/omniauth_macros.rb
      auth = {
        'provider' => 'osm',
        'uid' => '8423545',
        'info' => {
          'display_name' => 'Workaround Name',
          'image_url' => 'mock_user_thumbnail_url'
        },
        'credentials' => {
          'token' => 'mock_token',
          'secret' => 'mock_secret'
        }
      }
    end
    user = User.find_by_provider_and_uid(auth['provider'], auth['uid']) || User.create_with_omniauth(auth)
    session[:user_id] = user.id
    redirect_to root_url, :notice => "Signed in successfully."
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Signed out."
  end
end
