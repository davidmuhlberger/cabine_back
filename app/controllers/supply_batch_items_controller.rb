class SupplyBatchItemsController < ApplicationController

  def selection
    find_supply_batch
  end

  def finalization
    find_supply_batch
    @supply_batch.supply_batch_items.each do |item|
      if item.expected_quantity == 0
        item.destroy
      end
    end
    redirect_to supply_batches_path
  end

  def update
    find_supply_batch
    @supply_batch_item = SupplyBatchItem.find(params[:id])
    @supply_batch_item.update(supply_batch_item_params)
    redirect_to supply_batch_supply_batch_items_selection_path
  end

  private

  def supply_batch_item_params
    params.require(:supply_batch_item).permit(:expected_quantity)
  end

  def find_supply_batch
    @supply_batch = SupplyBatch.find(params[:supply_batch_id])
  end

end
