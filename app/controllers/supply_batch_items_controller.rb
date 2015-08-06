class SupplyBatchItemsController < ApplicationController

  def selection
    find_supply
    find_supply_batch
  end

  def reception
    find_supply
  end

  def finalization
    find_supply
    find_supply_batch
    @supply_batch.supply_batch_items.each do |item|
      if item.expected_quantity == 0
        item.destroy
      end
    end
    redirect_to supplies_path
  end

  def finalization_new
    find_supply
    find_supply_batch
    @supply_batch.supply_batch_items.each do |item|
      if item.expected_quantity == 0
        item.destroy
      end
    end
    redirect_to new_supply_supply_batch_path(@supply)
  end

  def update
    find_supply
    find_supply_batch
    @supply_batch_item = SupplyBatchItem.find(params[:id])
    @supply_batch_item.update(supply_batch_item_params)
    redirect_to supply_supply_batch_supply_batch_items_selection_path(@supply, @supply_batch)
  end

  def update_received_quantity
    find_supply
    find_supply_batch_item
    @supply_batch_item.update(supply_batch_item_received_quantity_params)
    redirect_to supply_supply_batch_items_reception_path(@supply)
  end

  def finalization_received_quantity
    find_supply
    @supply.supply_batches.each do |batch|
      batch.supply_batch_items.each do |item|
        if item.product_ref
          item.product_ref.inventory_quantity_cabine += item.received_quantity
          item.product_ref.save
        end
      end
    end
    redirect_to supplies_path
  end

  private

  def supply_batch_item_params
    params.require(:supply_batch_item).permit(:expected_quantity)
  end

  def supply_batch_item_received_quantity_params
    params.require(:supply_batch_item).permit(:received_quantity)
  end

  def find_supply_batch
    @supply_batch = SupplyBatch.find(params[:supply_batch_id])
  end

  def find_supply
    @supply = Supply.find(params[:supply_id])
  end

  def find_supply_batch_item
    @supply_batch_item = SupplyBatchItem.find(params[:id])
  end

end
