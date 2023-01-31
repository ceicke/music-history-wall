class SonosSystem < ApplicationRecord

  validates :name, presence: true
  validates :ip, presence: true

  scope :active, -> { where(default: true) }

  def add_to_queue(mp3 = 'http://ia801402.us.archive.org/20/items/TenD2005-07-16.flac16/TenD2005-07-16t10Wonderboy.mp3')
    sonos("add_uri_to_queue #{mp3}")
  end

  def clear_queue
    sonos('clear_queue')
  end

  def play
    sonos('play')
  end

  def stop
    sonos('stop')
  end

  def end_session
    sonos('end_session')
  end

  def set_volume(volume = 20)
    sonos("volumen #{volume}")
  end

  private
    def sonos(parameters)
      logger.info system("/usr/local/bin/sonos #{self.name} parameters")
    end

end
