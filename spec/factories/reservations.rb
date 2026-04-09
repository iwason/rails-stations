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
FactoryBot.define do
  factory :reservation do
    date { "2026-04-09" }
    schedule { nil }
    sheet { nil }
    email { "MyString" }
    name { "MyString" }
  end
end
