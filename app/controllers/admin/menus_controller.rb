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
      flash[:success] = t ".success"
      redirect_to admin_menus_path
    else
      flash[:error] = t ".error"
      render :new
    end
  end

  def edit; end

  def update
    if @menu.update_attributes menu_params
      flash[:success] = t ".success"
      redirect_to admin_menus_path
    else
      flash[:error] = t ".error"
      render :edit
    end
  end

  def destroy
    if @menu.destroy
      flash[:success] = t ".success"
    else
      flash[:error] = t ".error"
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
