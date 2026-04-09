class Admin::SchedulesController < ApplicationController
  layout "admin"
  before_action :set_movie, only: %i[ new create edit update destroy ]
  before_action :set_schedule, only: %i[ show edit update destroy ]

  def index
    @movies_with_schedules = Movie.includes(:schedules).where.not(schedules: { id: nil })
  end

  def new
    @schedule = @movie.schedules.build
  end

  def show
  end

  def edit
  end

  def create
    @schedule = @movie.schedules.build(schedule_params)

    if @schedule.save
      redirect_to admin_movie_path(@movie), notice: "スケジュールを登録しました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @schedule.update(schedule_params)
      redirect_to admin_schedule_url(@schedule), notice: "スケジュールを更新しました。"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @schedule.destroy
    redirect_to admin_movie_path(@schedule.movie), notice: "スケジュールを削除しました。"
  end

  private

  def schedule_params
    params.fetch(:schedule, {}).permit(:start_time, :end_time)
  end

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end

  def set_schedule
    @schedule = Schedule.find(params[:id])
  end
end
