class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    @movies = @movies.where(is_showing: params[:is_showing] == "true") if params[:is_showing].in?(%w[true false])
    if params[:keyword].present?
      keyword = "%#{ActiveRecord::Base.sanitize_sql_like(params[:keyword])}%"
      @movies = @movies.where("name LIKE ? OR description LIKE ?", keyword, keyword)
    end
  end
end
