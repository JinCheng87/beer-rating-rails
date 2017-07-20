require 'pry'
class RatingsController <ApplicationController

  before_action :find_beer, :find_rating, :authenticate_user!

  def new
    rating = current_user.ratings.new
    render :new, locals: { rating: rating, beer: @beer }
  end

  def index
    ratings = @beer.ratings
    render :index, locals: { beer: @beer, ratings: ratings }
  end

  def create
    rating = current_user.ratings.new(rating_params)
    if rating.save
      redirect_to beer_rating_path(@beer,rating), notice: 'rating created'
    else
      render :new, locals: {beer: @beer, rating: rating}
    end
  end

  def show
    render :show, locals: { beer: @beer, rating: @rating, user_name: current_user.name}
  end

  def edit
    render :edit, locals: { beer: @beer, rating: @rating }
  end

  def update
    if @rating.update_attributes(rating_params)
      redirect_to beer_rating_path(@beer,@rating), notice: 'updated successed'
    else
      render :edit, locals: {beer: @beer, rating: @rating}
    end
  end

  def destroy
    @rating.destroy
    redirect_to beer_ratings_path(@beer), notice: 'rating deleted'
  end

  private

  def find_beer
    @beer = Beer.find_by(id: params[:beer_id])
  end

  def rating_params
    input_params = params.require(:rating).permit(:id, :stars, :comment)
    input_params.merge(beer_id: params[:beer_id])
  end

  def find_rating
    @rating = Rating.find_by(id: params[:id])
  end
end