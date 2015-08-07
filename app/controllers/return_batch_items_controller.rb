class ReturnBatchItemsController < ApplicationController

  def selection
    find_return
    find_return_batch
  end

  def update
    find_return
    find_return_batch
    find_return_batch_item
    @return_batch_item.update(return_batch_item_params)
    redirect_to return_return_batch_return_batch_items_selection_path(@return, @return_batch)
  end

  def finalization
    find_return
    find_return_batch
    @return_batch.return_batch_items.each do |item|
      if item.quantity == 0
        item.destroy
      end
    end
    redirect_to returns_path
  end

  def finalization_new
    find_return
    find_return_batch
    @return_batch.return_batch_items.each do |item|
      if item.quantity == 0
        item.destroy
      end
    end
    redirect_to new_return_return_batch_path(@return)
  end

  private

  def return_batch_item_params
    params.require(:return_batch_item).permit(:quantity)
  end

  def find_return_batch
    @return_batch = ReturnBatch.find(params[:return_batch_id])
  end

  def find_return
    @return = Return.find(params[:return_id])
  end

  def find_return_batch_item
    @return_batch_item = ReturnBatchItem.find(params[:id])
  end

end
