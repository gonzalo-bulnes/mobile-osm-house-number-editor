class HouseNumbersController < ApplicationController

  def index
  end

  def create
    @housenumber = HouseNumber.new(params[:house_number])
    if @housenumber.save
      flash[:success] = "Welcome!"
      redirect_to @housenumber # Shortcut to house_number_path
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
