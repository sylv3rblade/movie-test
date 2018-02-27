# frozen_string_literal: true

class MoviesController < ApplicationController
  before_action :find_movie, only: %i{show}
  def index
    render json: Movie.all.collect { |movie| MovieSerializer.new(movie).data }
  end

  def show
    render json: MovieSerializer.new(@movie, true).data
  end

  private

  def find_movie
    @movie = Movie.find(params[:id])
  end
end
