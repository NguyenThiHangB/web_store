class Admin::SlidesController < ApplicationController
  before_action :find_slide, only: %i(edit update destroy)

  def index
    @slides = Slide.search(params[:search]).order_by
                   .page(params[:page]).per Settings.paginate.per_page
  end

  def new
    @slide = Slide.new
  end

  def create
    @slide = Slide.new slide_params
    if @slide.save
      flash[:success] = t ".success"
      redirect_to admin_slides_path
    else
      flash[:error] = t ".error"
      render :new
    end
  end

  def edit; end

  def update
    if @slide.update_attributes slide_params
      flash[:success] = t ".success"
      redirect_to admin_slides_path
    else
      flash[:error] = t ".error"
      render :edit
    end
  end

  def destroy
    if @slide.destroy
      flash[:success] = t ".success"
    else
      flash[:error] = t ".error"
    end
    redirect_to admin_slides_path
  end

  private

  def slide_params
    params.require(:slide).permit :name, :image, :content, :link
  end

  def find_slide
    @slide = Slide.find_by id: params[:id]
    return if @slide
    flash[:danger] = t ".danger"
    redirect_to admin_slides_path
  end
end
