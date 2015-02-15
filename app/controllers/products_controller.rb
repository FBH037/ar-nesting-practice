class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :destroy, :update]
  before_action :set_company
  before_filter :authorize, only: [:edit, :update]
  

  def index
    @products = product.all
  end

  def show
    @locations = @product.locations
  end

  def new
    @product = product.new
  end

  def edit
  end

  def create
    @product = product.new(product_params)
    @product.company_id = params[:company_id]
    if @product.save
      redirect_to company_product_path(@company, @product)
    else
      render :new
    end
  end

  def update
    if @product.update
      redirect_to company_product_path(@company, @product)
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    if @product.destroy
      redirect_to company_path(@company)
    end
  end

  private

  def set_product
    @product = product.find(params[:id])
  end

  def set_company
    @company = Company.find(params[:company_id])
  end

  def product_params
    params.require(:product).permit(:department, :name, :price)
  end

end
