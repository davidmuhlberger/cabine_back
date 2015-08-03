class ProductRefsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_product, only: [:new, :create, :index, :edit, :update, :destroy]
  before_action :find_product_ref, only: [:edit, :update, :show, :destroy]
  before_action :find_brand, only: [:index, :new, :create, :destroy]

  def index
    @product_refs = []
    @product.product_refs.each do |product_ref|
      @product_refs << product_ref
    end
  end

  def new
    @product_ref = ProductRef.new
  end

  def create
    @product_ref = @product.product_refs.build(product_ref_params)
    @product_ref.product = @product
    @product_ref.sku_name = "#{@product.brand.name}-#{@product.name}-#{@product_ref.size}"
    if @product.save
      redirect_to brand_product_product_refs_path(@brand, @product)
    else
      render :new
    end
  end

  def edit

  end

  def update
    @product.update(product_params)
    redirect_to brand_products_path(@brand)
  end

  def destroy
    @product_ref.destroy
    redirect_to brand_product_product_refs_path(@brand, @product)
  end

  private

  def product_ref_params
    params.require(:product_ref).permit(:size, :inventory_quantity_cabine, :inventory_type, :inventory_brand_availability)
  end

  def find_product
    @product = Product.find(params[:product_id])
  end

  def find_brand
    @brand = Brand.find(params[:brand_id])
  end

  def find_product_ref
    find_product
    @product_ref = @product.product_refs.find(params[:id])
  end

end
