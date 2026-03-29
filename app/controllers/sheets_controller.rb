class SheetsController < ApplicationController
  def index
    @sheets_by_row = Sheet.order(:row, :column).group_by(&:row)
  end
end
