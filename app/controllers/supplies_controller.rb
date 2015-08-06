class SuppliesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_brand, only: [:new, :create, :index, :edit, :update,]

  def index
    @supplies = Supply.all
  end

  def show
    @supply = Supply.find(params[:id])
  end

  def new
    @supply = Supply.new
  end

  def create
    @supply = @brand.supplies.build(supply_params)
    @supply.brand = @brand
    @supply.status = "En cours"
    if @product.save
    else
      render :new
    end
  end


  private

  def supply_params
    params.require(:supply).permit(:order_date, :expected_reception_date,
      :comment)
  end

  def find_brand
    @brand = Brand.find(params[:brand_id])
  end

end
