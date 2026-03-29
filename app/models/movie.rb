# == Schema Information
#
# Table name: movies
#
#  id                                                 :bigint           not null, primary key
#  description(映画の説明文)                          :text(65535)
#  image_url(映画のポスター画像が格納されているURL)   :string(150)
#  is_showing(上映中かどうか)                         :boolean          not null
#  name(映画のタイトル。邦題・洋題は一旦考えなくてOK) :string(160)      not null
#  year(公開年)                                       :string(45)
#  created_at                                         :datetime         not null
#  updated_at                                         :datetime         not null
#
# Indexes
#
#  index_movies_on_name  (name)
#
class Movie < ApplicationRecord
  has_many :schedules
  validates :name, presence: { message: "映画名は必須です" }, uniqueness: { message: "同じ映画名は登録できません" }
  validates :is_showing, inclusion: { in: [ true, false ] }

  def showing?
    is_showing
  end
end
