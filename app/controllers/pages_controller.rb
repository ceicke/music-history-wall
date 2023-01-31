class PagesController < ApplicationController

  def charts
    @albums = Album.where('play_count > 0').order(play_count: :desc).limit(50)
  end

end
