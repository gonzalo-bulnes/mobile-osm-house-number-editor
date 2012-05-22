class HouseNumbersController < ApplicationController

  def index
  end

  def create
    @housenumber = HouseNumber.new(params[:house_number])
    if @housenumber.save
      flash[:success] = "Welcome!"
      redirect_to @housenumber # Shortcut to user_path
    else
      render 'new'
    end
  end

  def new
    @housenumber = HouseNumber.new
  end

  def show
    @housenumber = HouseNumber.find(params[:id])
  end
end
