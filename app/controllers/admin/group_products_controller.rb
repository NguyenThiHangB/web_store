class Admin::GroupProductsController < ApplicationController
  before_action :find_group_product, only: %i(edit update destroy)

  def index
    @group_products = GroupProduct.search(params[:search]).order_by
                                  .page(params[:page])
                                  .per Settings.paginate.per_page
  end

  def new
    @group_product = GroupProduct.new
  end

  def create
    @group_product = GroupProduct.new group_product_params
    if @group_product.save
      flash[:success] = t "admin.flash.create.success", title: "group product"
      redirect_to admin_group_products_path
    else
      flash[:error] = t "admin.flash.create.error", title: "group product"
      render :new
    end
  end

  def edit; end

  def update
    if @group_product.update_attributes group_product_params
      flash[:success] = t "admin.flash.update.success", title: "group product"
      redirect_to admin_group_products_path
    else
      flash[:error] = t "admin.flash.update.error", title: "group product"
      render :edit
    end
  end

  def destroy
    if @group_product.destroy
      flash[:success] = t "admin.flash.destroy.success", title: "group product"
    else
      flash[:error] = t "admin.flash.destroy.error", title: "group product"
    end
    redirect_to admin_group_products_path
  end

  private

  def group_product_params
    params.require(:group_product).permit :name, :content, :order, :status
  end

  def find_group_product
    @group_product = GroupProduct.find_by id: params[:id]
    return if @group_product
    flash[:danger] = t ".danger"
    redirect_to admin_group_products_path
  end
end
