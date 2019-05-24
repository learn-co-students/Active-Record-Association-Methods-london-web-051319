class Genre < ActiveRecord::Base
  has_many :songs
  has_many :artists, through: :songs

  def song_count
    # return the number of songs in a genre
    Song.all.select{|inst| inst.genre_id == self.id}.count
  end

  def artist_count
    # return the number of artists associated with the genre
    Song.all.select{|inst| inst.genre_id == self.id}.map{|inst| inst.artist_id}.uniq.count
    
   end
   
   def all_artist_names
      # return an array of strings containing every musician's name
      art_ids = Song.all.select{|inst| inst.genre_id == self.id}.map{|inst| inst.artist_id}.uniq
      # b = art_ids.each{|inst| Artist.all.select{|x| x.id == inst}}
      a = []
      b = art_ids.each do |inst| 
         a << Artist.all.select{|x| x.id == inst}
      end
      # binding.pry
      a.flatten.map{|inst| inst.name}
  end
end
