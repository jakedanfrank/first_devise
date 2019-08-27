class DrinksController < ApplicationController
  before_action :set_drink, only: [:show, :edit, :update, :destroy]

  def index
    @drinks = current_user.drinks 
  end

  def show
  end

  def new
    @drink = Drink.new
  end

  def create 
    @drink = current_user.drinks.new(drink_params)
    if @drink.save
      flash[:success] = "Drink Saved"
      redirect_to drinks_path
    else 
      flash[:error] = "Error #{@drink.errors.full_messages.join("\n")}"
      render :new
    end
  end

  def edit
  end 

  def update 
    @drink = Drink.find(params[:id])
    if @drink.update(drink_params)
      redirect_to drink_path 
    else
      render :edit 
    end 
  end

  def destroy
    @drink.destroy
    redirect_to drinks_path
  end


  private 

    def drink_params
      params.require(:drink).permit(:name)
    end

    def set_drink
      @drink = current_user.drinks.find(params[:id])
    end
end