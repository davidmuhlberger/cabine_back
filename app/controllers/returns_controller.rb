class ReturnsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_brand, only: [:new, :create, :edit, :update]

  def index
    @returns = Return.all
  end

  def brand_choice
    @brands = Brand.all
  end

  def new
    @return = Return.new
  end

  def create
    @return = @brand.returns.build(return_params)
    @return.brand = @brand
    @return.status = "A renvoyer"
    if @return.save
      redirect_to new_return_return_batch_path(@return)
    else
      render :new
    end
  end

  private

  def return_params
    params.require(:return).permit(:expected_date,
      :comment)
  end

  def find_brand
    @brand = Brand.find(params[:brand_id])
  end

  def find_return
    @return = Return.find(params[:id])
  end

end
