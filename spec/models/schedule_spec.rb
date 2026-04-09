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
require 'rails_helper'

RSpec.describe Schedule, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
