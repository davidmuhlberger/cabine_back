class ProductRefsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_product, only: [:new, :create, :index, :edit, :update, :destroy, :auto_new, :auto_create]
  before_action :find_product_ref, only: [:edit, :update, :show, :destroy]
  before_action :find_brand, only: [:index, :new, :create, :destroy, :edit, :update, :auto_create, :auto_new]

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
    @product_ref.inventory_quantity_cabine = 0
    if @product_ref.save
      redirect_to brand_product_product_refs_path(@brand, @product)
    else
      render :new
    end
  end

  def auto_new
    @product_ref = ProductRef.new
  end

  def auto_create
    @product_ref = ProductRef.new
    @product_ref = @product.product_refs.build(product_ref_auto_params)
    if @product.gender == "Homme"
      @product_ref.size = 40
    elsif @product.gender == "Femme"
      @product_ref.size = 35
    end
    @product_ref.sku_name = "#{@product.brand.name}-#{@product.name}-#{@product_ref.size}"
    @product_ref.inventory_quantity_cabine = 0
    @product_ref.save
    if @product.gender == "Homme"
      (41..46).each do |number|
        product_ref = ProductRef.new
        product_ref.size = number
        product_ref.product = @product
        product_ref.sku_name = "#{@product.brand.name}-#{@product.name}-#{number}"
        product_ref.inventory_quantity_cabine = 0
        product_ref.inventory_type = @product_ref.inventory_type
        product_ref.inventory_brand_availability = @product_ref.inventory_brand_availability
        product_ref.save
      end
    elsif @product.gender == "Femme"
      (36..41).each do |number|
        product_ref = ProductRef.new
        product_ref.size = number
        product_ref.product = @product
        product_ref.sku_name = "#{@product.brand.name}-#{@product.name}-#{number}"
        product_ref.inventory_quantity_cabine = 0
        product_ref.inventory_type = @product_ref.inventory_type
        product_ref.inventory_brand_availability = @product_ref.inventory_brand_availability
        product_ref.save
      end
    end
    redirect_to brand_product_product_refs_path(@brand, @product)
  end

  def edit

  end

  def update
    @product_ref.update(product_ref_params)
    redirect_to brand_product_product_refs_path(@brand, @product)
  end

  def destroy
    @product_ref.destroy
    redirect_to brand_product_product_refs_path(@brand, @product)
  end

  private

  def product_ref_params
    params.require(:product_ref).permit(:size, :inventory_type, :inventory_brand_availability)
  end

  def product_ref_auto_params
    params.require(:product_ref_auto).permit(:inventory_type, :inventory_brand_availability)
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
