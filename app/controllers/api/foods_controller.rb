class Api::FoodsController < ApiController
  before_action :set_food, only: %i[show edit update destroy]
  # before_action :authenticate_user!

  def index
    render json: Food.all
  end

  def show
    render json: @food
  end
  
  def create
    food = Food.new(food_params)

    if food.save
      render json: food , status: :created
    else
      render json: {}
    end
  end

  def update
    if @food.update(food_params)
      render json: @food
    else
      render json: {}
    end
  end

  def destroy
    @food.destroy
    render json: {} , status: :no_content
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_food
    @food = Food.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def food_params
    params.require(:food).permit(:name, :price)
  end
end