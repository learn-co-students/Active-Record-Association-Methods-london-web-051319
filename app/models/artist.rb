class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def get_first_song
    self.songs.first
  end

  def get_genre_of_first_song
    get_first_song.genre
        #return the genre of the artist's first saved song
  end

  def get_all_songs
    self.songs
  end

  def song_count
    #return the number of songs associated with the artist
    get_all_songs.count
  end

  def genre_count
    #return the number of genres associated with the artist
    self.genres.count
  end
end
