class AuthenticationsController < ApplicationController
  def index
    @authentications = Authentication.all
  end

  def create
    auth = request.env["omniauth.auth"]
    current_user.authentications.find_or_create_by_provider_and_uid(:provider => auth['provider'], :uid => auth['uid'])
    flash[:notice] = "Authentication successful."
    redirect_to authentications_url
    #render :text => request.env["omniauth.auth"].to_yaml
  end

  def destroy
    @authentication = Authentication.find(params[:id])
    @authentication.destroy
    redirect_to authentications_url, :notice => "Successfully destroyed authentication."
  end
end
