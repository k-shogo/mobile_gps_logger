class ReverseGeocodingWorker
  include Sidekiq::Worker
  sidekiq_options retry: 3, queue: :geocoding

  def perform(pin_id)
    pin = Pin.find(pin_id)
    pin.reverse_geocode
    pin.save
  end
end
