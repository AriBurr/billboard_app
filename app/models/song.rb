class Song < ApplicationRecord
  belongs_to :artist
  belongs_to :billboard, optional: true

  def self.find_song_not_on_billboard
    Song.where('billboard_id IS ?', nil)
  end

end
