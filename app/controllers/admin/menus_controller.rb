class Admin::MenusController < ApplicationController
  before_action :find_menu, only: %i(edit update destroy)

  def index
    @menus = Menu.search(params[:search]).order_by
                 .page(params[:page]).per Settings.paginate.per_page
  end

  def new
    @menu = Menu.new
  end

  def create
    @menu = Menu.new menu_params
    if @menu.save
      flash[:success] = t "admin.flash.create.success", title: "menu"
      redirect_to admin_menus_path
    else
      flash[:error] = t "admin.flash.create.error", title: "menu"
      render :new
    end
  end

  def edit; end

  def update
    if @menu.update_attributes menu_params
      flash[:success] = t "admin.flash.update.success", title: "menu"
      redirect_to admin_menus_path
    else
      flash[:error] = t "admin.flash.update.error", title: "menu"
      render :edit
    end
  end

  def destroy
    if @menu.destroy
      flash[:success] = t "admin.flash.destroy.success", title: "menu"
    else
      flash[:error] = t "admin.flash.destroy.error", title: "menu"
    end
    redirect_to admin_menus_path
  end

  private

  def menu_params
    params.require(:menu).permit :name, :link, :order, :status
  end

  def find_menu
    @menu = Menu.find_by id: params[:id]
    return if @menu
    flash[:danger] = t ".danger"
    redirect_to admin_menus_path
  end
end
