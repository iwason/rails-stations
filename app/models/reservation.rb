# == Schema Information
#
# Table name: reservations
#
#  id                          :bigint           not null, primary key
#  date                        :date             not null
#  email(予約者メールアドレス) :string(255)      not null
#  name(予約者名)              :string(50)       not null
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#  schedule_id                 :bigint           not null
#  sheet_id                    :bigint           not null
#
# Indexes
#
#  index_reservations_on_schedule_id  (schedule_id)
#  index_reservations_on_sheet_id     (sheet_id)
#  reservation_schedule_sheet_unique  (date,schedule_id,sheet_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (schedule_id => schedules.id)
#  fk_rails_...  (sheet_id => sheets.id)
#
class Reservation < ApplicationRecord
  belongs_to :schedule
  belongs_to :sheet
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :name, presence: true
  validates :sheet_id, uniqueness: { scope: [:schedule_id, :date], message: "その座席はすでに予約済みです" }
end
