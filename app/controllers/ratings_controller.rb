class RatingsController <ApplicationController

  before_action :find_beer, :find_rating, :authenticate_user!

  





  private

  def find_beer
    @beer = Beer.find_by(id: params[:beer_id])
  end

  def find_rating
    @rating = Rating.find_by(id: params[:id])
  end
end