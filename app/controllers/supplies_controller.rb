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
    @supply.update(supply_reception_date_params)
    @supply.status = "Reçu"
    @supply.save
    @supply.supply_batches.each do |batch|
      batch.supply_batch_items.each do |item|
        item.received_quantity = item.expected_quantity
        item.save
      end
    end
    redirect_to supply_supply_batch_items_reception_path(@supply)
  end

  def reception_date
    find_supply
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

  def supply_reception_date_params
    params.require(:supply).permit(:reception_date)
  end

  def find_brand
    @brand = Brand.find(params[:brand_id])
  end

  def find_supply
    @supply = Supply.find(params[:id])
  end

end
