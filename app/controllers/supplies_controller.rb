class SuppliesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_brand, only: [:new, :create, :edit, :update]

  def index
    @supplies = Supply.all
  end

  def cancel
    find_supply
    @supply.status = "Annulé"
    @supply.save
    redirect_to supplies_path
  end

  def reception
    find_supply
    @supply.status = "Reçu"
    @supply.save
    # to do
    redirect_to supplies_path
  end

  def show
    find_supply
  end

  def new
    @supply = Supply.new
  end

  def brand_choice
    @brands = Brand.all
  end

  def create
    @supply = @brand.supplies.build(supply_params)
    @supply.brand = @brand
    @supply.status = "En cours"
    if @supply.save
      redirect_to new_supply_supply_batch_path(@supply)
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

  def find_supply
    @supply = Supply.find(params[:id])
  end

end
