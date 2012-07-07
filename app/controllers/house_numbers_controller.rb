class HouseNumbersController < ApplicationController
  before_filter :authenticate_user!, only: [:create, :destroy, :index, :show]

  def index
  end

  def create
    @housenumber = current_user.house_numbers.build(params[:house_number])
    if @housenumber.save
      flash[:success] = "Success"
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
