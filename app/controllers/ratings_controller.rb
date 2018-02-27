# frozen_string_literal: true

class RatingsController < ApplicationController
  before_action :find_rating, only: %i{show update delete}
  def index
    render json: Rating.all.collect { |rating| RatingSerializer.new(rating).data }
  end

  def show
    render json: RatingSerializer.new(Rating.find(params[:id]), true).data
  end

  def create
    rating = Rating.create(rating_params)
    render json: RatingSerializer.new(rating, true).data
  end

  def update
    @rating.update!(rating_params)
    render json: RatingSerializer.new(@rating, true).data
  end

  private

  def rating_params
    # TODO: move user_id to current_user id
    params.require(:rating).permit(:score, :user_id, :movie_id)
  end

  def find_rating
    @rating = Rating.find(params[:id])
  end
end
