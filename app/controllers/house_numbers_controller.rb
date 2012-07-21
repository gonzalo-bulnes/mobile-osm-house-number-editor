class HouseNumbersController < ApplicationController
  # Not implemented since Devise was removed
  #before_filter :authenticate_user!, only: [:create, :destroy, :index, :show]
  before_filter :sign_in_required, only: [:create, :destroy, :index]

  def index
  end

  def create
    # Not implemented since Devise was removed
    @housenumber = current_user.house_numbers.build(params[:house_number])
    if @housenumber.save
      flash[:success] = "Success!"
      redirect_to root_path
    else
      render 'pages/home'
    end
  end

  def new
    @housenumber = HouseNumber.new
    render 'pages/home'
  end

  def show
    @housenumber = HouseNumber.find(params[:id])
  end

  def destroy
  end
end
