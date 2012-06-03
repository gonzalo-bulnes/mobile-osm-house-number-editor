class HouseNumbersController < ApplicationController

  def index
  end

  def create
    @housenumber = HouseNumber.new(params[:house_number])
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
end
