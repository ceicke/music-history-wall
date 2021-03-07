class AlbumsController < ApplicationController
  before_action :set_album, only: %i[ show edit update destroy play]

  # GET /albums or /albums.json
  def index
    @albums = Album.all
  end

  # GET /albums/1 or /albums/1.json
  def show
    @album_artwork_url = @album.get_artwork
  end

  # GET /albums/new
  def new
    @album = Album.new
    @album.titles.build
  end

  # GET /albums/1/edit
  def edit
  end

  # POST /albums or /albums.json
  def create
    @album = Album.new(album_params)

    respond_to do |format|
      if @album.save
        format.html { redirect_to @album, notice: "Album was successfully created." }
        format.json { render :show, status: :created, location: @album }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /albums/1 or /albums/1.json
  def update
    respond_to do |format|
      if @album.update(album_params)
        format.html { redirect_to @album, notice: "Album was successfully updated." }
        format.json { render :show, status: :ok, location: @album }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /albums/1 or /albums/1.json
  def destroy
    @album.destroy
    respond_to do |format|
      format.html { redirect_to albums_url, notice: "Album was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def play
    s = SonosSystem.last
    s.setup
    s.stop
    s.clear_queue

    @album.titles.each do |title|
      title_url = url_for title.audio_data
      s.add_to_queue(title_url)
    end

    s.play

    @album.update_attribute(:play_count, @album.play_count + 1)

    respond_to do |format|
      format.html { redirect_to @album, notice: "Playing on Sonos" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_album
      @album = Album.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def album_params
      params.require(:album).permit(:title, titles_attributes: [:id, :title, :audio_data, :_destroy])
    end
end
