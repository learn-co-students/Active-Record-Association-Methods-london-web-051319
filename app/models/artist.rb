class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def get_genre_of_first_song
    id = self.songs.first.genre_id
    Genre.find_by(id: id)
  end

  def song_count
    self.songs.count
  end

  def genre_count
    self.genres.count
  end
end
