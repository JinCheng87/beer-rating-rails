class BeersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_beer

  def new
    beer = Beer.new
    render :new, locals: { beer: beer }
  end

  def index
    beers = Beer.all
    render :index, locals: { beers: beers}
  end

  def create
    @beer = Beer.new(beer_params)
    if @beer.save!
      redirect_to @beer, notice: "#{@beer.name} created sucessfully"
    else
      render :new, locals: { beer: @beer }
    end
  end

  def edit
    render :edit, locals: {beer: @beer}
  end

  def update
    if @beer.update_attributes(beer_params)
      redirect_to @beer, notice: "edited sucessfully"
    else
      render :edit, locals: {beer: @beer}
    end
  end

  def destroy
    @beer.destroy
    redirect_to beers_path
  end

  def show
    render :show, locals: { beer: @beer }
  end

  private

  def beer_params
    params.require(:beer).permit(:name, :description)
  end

  def find_beer
    @beer = Beer.find_by(id: params[:id])
  end
end