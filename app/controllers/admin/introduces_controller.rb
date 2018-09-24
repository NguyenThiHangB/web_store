class Admin::IntroducesController < ApplicationController
  before_action :find_introduce, only: %i(edit update destroy)

  def index
    @introduces = Introduce.search(params[:search]).order_by
                           .page(params[:page]).per Settings.paginate.per_page
  end

  def new
    @introduce = Introduce.new
  end

  def create
    @introduce = Introduce.new introduce_params
    if @introduce.save
      flash[:success] = t ".success"
      redirect_to admin_introduces_path
    else
      flash[:error] = t ".error"
      render :new
    end
  end

  def edit; end

  def update
    if @introduce.update_attributes introduce_params
      flash[:success] = t ".success"
      redirect_to admin_introduces_path
    else
      flash[:error] = t ".error"
      render :edit
    end
  end

  def destroy
    if @introduce.destroy
      flash[:success] = t ".success"
    else
      flash[:error] = t ".error"
    end
    redirect_to admin_introduces_path
  end

  private

  def introduce_params
    params.require(:introduce).permit :name, :image, :description
  end

  def find_introduce
    @introduce = Introduce.find_by id: params[:id]
    return if @introduce
    flash[:danger] = t ".danger"
    redirect_to admin_introduces_path
  end
end
