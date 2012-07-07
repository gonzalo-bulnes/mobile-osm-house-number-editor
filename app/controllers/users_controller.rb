class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @house_numbers = @user.house_numbers
  end
end
