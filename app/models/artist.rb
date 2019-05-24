class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def get_genre_of_first_song
    #return the genre of the artist's first saved song
   #  Artist.all.first.genre
   gen_id = Song.all.select{|inst| inst.artist_id == self.id}[0].genre_id
   Genre.all.select{|inst| inst.id == gen_id}[0]
end

def song_count
   #return the number of songs associated with the artist
   Song.all.select{|inst| inst.artist_id == self.id}.count
end

def genre_count
   #return the number of genres associated with the artist
   Song.all.select{|inst| inst.artist_id == self.id}.map{|inst| inst.genre_id}.uniq.count
  end
end
