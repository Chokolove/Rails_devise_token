class FoodsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update destroy]
  
  def index
    @foods = Food.all
  end

  def new
    @food = Food.new
  end

  def show
    @food = Food.find(params[:id])
  end

  def create
    @food = Food.new(food_params)
    if @food.save
      redirect_to @food
    else
      render :new
    end
  end

  def edit
    @food = Food.find(params[:id])
  end

  def update
    @food = Food.find(params[:id])
    if @food.update(food_params)
      redirect_to @food
    else
      render :edit
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    redirect_to root_path
  end

  private
    def food_params
      params.require(:food).permit(:name, :price)
    end

    def log_in?
        
    end
end
