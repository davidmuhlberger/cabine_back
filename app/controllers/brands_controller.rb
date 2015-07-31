class BrandsController < ApplicationController

  def index
      @brands = Brand.all
    end

    def directory
      @brands = Brand.all
    end

    def new
      @brand = Brand.new
    end

    def create
      index
      @brand = @brands.build(brand_params)
      if @brand.save
        redirect_to brands_path
      else
        render :new
      end
    end

    def show
      find_brand
    end

    def edit
      find_brand
    end

    def update
      find_brand
      @brand.update(brand_params)
      redirect_to brand_path(@brand)
    end

    private

    def brand_params
      params.require(:brand).permit(:name, :contact_name, :contact_function,
        :address_street, :address_city, :address_zip, :email, :phone)
    end

    def find_brand
      @brand = Brand.find(params[:id])
    end

end
