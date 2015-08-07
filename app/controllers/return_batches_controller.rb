class ReturnBatchesController < ApplicationController

  def new
    find_return
    @products = []
    @return.brand.products.each do |product|
      @products << product
    end
    @return_batch = ReturnBatch.new
  end

  def create
    find_return
    @return_batch = ReturnBatch.new
    @return_batch = @return.return_batches.build(return_batch_params)
    if @return_batch.save
      @return_batch.product.product_refs.each do |product_ref|
        return_batch_item = ReturnBatchItem.new
        return_batch_item.product_ref_id = product_ref.id
        return_batch_item.return_batch_id = @return_batch.id
        return_batch_item.size = product_ref.size
        return_batch_item.sku_name = product_ref.sku_name
        return_batch_item.quantity = 0
        return_batch_item.save
      end
      redirect_to return_return_batch_return_batch_items_selection_path(@return, @return_batch)
    else
      render :new
    end
  end

  private

  def return_batch_params
    params.require(:return_batch).permit(:product_id)
  end

  def find_return_batch
    @return_batch = ReturnBatch.find(params[:id])
  end

  def find_return
    @return = Return.find(params[:return_id])
  end

end
