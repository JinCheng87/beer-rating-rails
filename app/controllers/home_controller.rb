class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    ratings = Rating.where(user_id: current_user.id)
    ratings.order(created_at: :desc)
    render :index, locals: { ratings: ratings}
  end
end