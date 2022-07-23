class ProductsController < ApplicationController
  before_action :set_product, only: %i[show update destroy]

  def index
    @product = Product.all
    render json: @product
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      render json: @product, status: :created
    else
      render json: { errors: @product.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    render json: @product
  end

  def update
    if @product.update(product_params)
      render json: @product
    else
      render json: { errors: @product.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
    head :ok
  end

  def search
    query = params[:query].downcase
    @products = Product.where("LOWER(name) LIKE ?", "%#{query}%")
    render json: @products
  end

  private

  def product_params
    params.require(:product).permit(:cod_product, :name, :laboratory, :quantity, :sale_price)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
