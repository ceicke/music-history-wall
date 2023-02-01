class PagesController < ApplicationController

  def charts
    @albums = Album.where('play_count > 0').order(play_count: :desc).limit(50)
    sql = "select sum(play_count) as total_plays from albums"
    records_array = ActiveRecord::Base.connection.execute(sql)
    @total_plays = records_array.first
  end

end
