class ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_brand, only: [:new, :create, :index, :edit, :update,]
  before_action :find_product, only: [:edit, :update, :show]

  def index
    @products = []
    @brand.products.each do |product|
      @products << product
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = @brand.products.build(product_params)
    @product.brand = @brand
    if @product.save
      redirect_to brand_product_auto_new_product_ref_path(@brand, @product)
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

  end

  private

  def product_params
    params.require(:product).permit(:category, :gender, :name, :availability, :purchase_price_ht,
      :gross_sell_price_ht, :vat_rate, :promotion_percentage)
  end

  def find_brand
    @brand = Brand.find(params[:brand_id])
  end

  def find_product
    find_brand
    @product = @brand.products.find(params[:id])
  end

end
