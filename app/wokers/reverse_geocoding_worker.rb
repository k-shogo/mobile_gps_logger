class ReverseGeocodingWorker
  include Sidekiq::Worker
  def perform(pin_id)
    pin = Pin.find(pin_id)
    pin.reverse_geocode
    pin.save
  end
end
