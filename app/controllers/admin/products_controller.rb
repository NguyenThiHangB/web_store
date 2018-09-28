class Admin::ProductsController < ApplicationController
  before_action :find_product, only: %i(edit update destroy)

  def index
    @search_products = Product.ransack params[:q]
    @products = @search_products.result.includes(:group_product).order_by
                                .page(params[:page])
                                .per Settings.paginate.per_page
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new product_params
    if @product.save
      flash[:success] = t "admin.flash.create.success", title: "product"
      redirect_to admin_products_path
    else
      flash[:error] = t "admin.flash.create.error", title: "product"
      render :new
    end
  end

  def edit; end

  def update
    if @product.update_attributes product_params
      flash[:success] = t "admin.flash.update.success", title: "product"
      redirect_to admin_products_path
    else
      flash[:error] = t "admin.flash.update.error", title: "product"
      render :edit
    end
  end

  def destroy
    if @product.destroy
      flash[:success] = t "admin.flash.destroy.success", title: "product"
    else
      flash[:error] = t "admin.flash.destroy.error", title: "product"
    end
    redirect_to admin_products_path
  end

  private

  def product_params
    params.require(:product).permit :name, :image, :summary, :price,
      :price_discount, :status, :group_product_id
  end

  def find_product
    @product = Product.find_by id: params[:id]
    return if @product
    flash[:danger] = t ".danger"
    redirect_to admin_products_path
  end
end
