class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    @movies = @movies.where(is_showing: params[:is_showing] == "true") if params[:is_showing].in?(%w[true false])
    if params[:keyword].present?
      keyword = "%#{ActiveRecord::Base.sanitize_sql_like(params[:keyword])}%"
      @movies = @movies.where("name LIKE ? OR description LIKE ?", keyword, keyword)
    end
  end

  def show
    @movie = Movie.includes(:schedules).find(params[:id])
    @schedules = @movie.schedules
  end

  def reservation
    unless params[:date].present? && params[:schedule_id].present?
      redirect_to movie_path(params[:id]) and return
    end

    @movie = Movie.find(params[:id])
    @sheets = Sheet.order(:row, :column)
  end

  private

  def movie_params
    params.require(:movie).permit(:id , :name, :description, :is_showing)
  end
end
