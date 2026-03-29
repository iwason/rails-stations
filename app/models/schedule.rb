# == Schema Information
#
# Table name: schedules
#
#  id                       :bigint           not null, primary key
#  end_time(上映終了時刻)   :time             not null
#  start_time(上映開始時刻) :time             not null
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  movie_id                 :bigint           not null
#
# Indexes
#
#  index_schedules_on_movie_id  (movie_id)
#
# Foreign Keys
#
#  fk_rails_...  (movie_id => movies.id)
#
class Schedule < ApplicationRecord
  belongs_to :movie
end
