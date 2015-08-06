class SupplyBatchesController < ApplicationController

  def index
    @supply_batches = SupplyBatch.all
  end

  def brand_choice
    @brands = Brand.all
  end

  def new
    find_brand
    @products = []
    @brand.products.each do |product|
      @products << product
    end
    @supply_batch = SupplyBatch.new
  end

  def create
    index
    @supply_batch = @supply_batches.build(supply_batch_params)
    @supply_batch.status = "En cours"
    if @supply_batch.save
      @supply_batch.product.product_refs.each do |product_ref|
        supply_batch_item = SupplyBatchItem.new
        supply_batch_item.product_ref_id = product_ref.id
        supply_batch_item.supply_batch_id = @supply_batch.id
        supply_batch_item.size = product_ref.size
        supply_batch_item.sku_name = product_ref.sku_name
        supply_batch_item.expected_quantity = 0
        supply_batch_item.save
      end
      redirect_to supply_batch_supply_batch_items_selection_path(@supply_batch)
    else
      render :new
    end
  end

  def show
    find_supply_batch
  end

  def edit
    find_supply_batch
  end

  def update
    if @supply_batch.update(supply_batch_params)
      redirect_to brand_path(@brand)
    else
      render :new
    end
  end

  private

#Attention : il va falloir différencier les params pour la création / édition classiques et une fonction d'enregistrement de la réception de la commande

  def supply_batch_params
    params.require(:supply_batch).permit(:product_id, :order_date, :expected_reception_date,
      :comment)
  end

  def find_supply_batch
    @supply_batch = SupplyBatch.find(params[:id])
  end

  def find_brand
    @brand = Brand.find(params[:brand_id])
  end

end
