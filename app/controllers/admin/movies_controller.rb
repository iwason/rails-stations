class Admin::MoviesController < ApplicationController
  layout "admin"
  before_action :set_movie, only: %i[ show edit update destroy ]

  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def show
  end

  def edit
  end

  def destroy
    @movie.destroy

    redirect_to admin_movies_url, notice: "映画を削除しました。"
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to admin_movie_url(@movie), notice: "映画を登録しました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @movie.update(movie_params)
      redirect_to admin_movie_url(@movie), notice: "映画を更新しました。"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

    # Only allow a list of trusted parameters through.
    def movie_params
      params.fetch(
        :movie,
        {}
      ).permit(:name, :is_showing, :year, :description, :image_url)
    end

    def set_movie
      @movie = Movie.find(params[:id])
    end
end
