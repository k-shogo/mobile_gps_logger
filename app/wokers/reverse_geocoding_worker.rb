class ReverseGeocodingWorker
  include Sidekiq::Worker
  sidekiq_options retry: 3, queue: :geocoding

  def perform(pin_id)
    pin = Pin.where(id: pin_id).first
    pin.try(:reverse_geocode)
    pin.try(:save)
  end
end
