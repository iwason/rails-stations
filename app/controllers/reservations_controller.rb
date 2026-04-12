class ReservationsController < ApplicationController
  before_action :require_date_and_sheet, only: [:new]

  def new
    @movie = Movie.find(params[:movie_id])
    @schedule = Schedule.find(params[:schedule_id])
    @date = params[:date]
    @sheet = Sheet.find(params[:sheet_id])
    @reservation = Reservation.new
  end

  def create
    reservation = Reservation.new(reservation_params)

    if reservation.save
      flash[:notice] = '予約しました'
      redirect_to movie_path(reservation.schedule.movie)
    else
      flash[:alert] = reservation.errors.full_messages.to_sentence
      redirect_to reservation_movie_path(
        params[:reservation][:movie_id],
        schedule_id: reservation_params[:schedule_id],
        date: reservation_params[:date]
      )
    end
  end

  private

  def require_date_and_sheet
    unless params[:date].present? && params[:sheet_id].present?
      redirect_to reservation_movie_path(params[:movie_id], schedule_id: params[:schedule_id])
    end
  end

  def reservation_params
    params.require(:reservation).permit(:name, :email, :date, :sheet_id, :schedule_id)
  end
end
