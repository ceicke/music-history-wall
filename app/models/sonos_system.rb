class SonosSystem < ApplicationRecord

  validates :name, presence: true
  validates :ip, presence: true

  def setup
    @speaker = Sonos::Device::Speaker.new(ip)

    def @speaker.group_master
      OpenStruct.new(ip: ip)
    end
  end

  def add_to_queue(mp3 = 'http://ia801402.us.archive.org/20/items/TenD2005-07-16.flac16/TenD2005-07-16t10Wonderboy.mp3')
    @speaker.add_to_queue mp3
  end

  def queue
    @speaker.queue
  end

  def clear_queue
    @speaker.clear_queue
  end

  def play
    @speaker.play
  end

  def stop
    @speaker.stop
  end
end
