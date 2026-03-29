# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

movie = Movie.find_by(id: 1)
if movie && movie.schedules.none?
  movie.schedules.create!([
    { start_time: "10:00", end_time: "12:00" },
    { start_time: "13:00", end_time: "15:00" },
    { start_time: "16:00", end_time: "18:00" },
  ])
end
