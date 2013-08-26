class Pin < ActiveRecord::Base
  reverse_geocoded_by :latitude, :longitude
  # after_validation :reverse_geocode

  def static_map_url zoom: 16, size: '600x400'
    "http://maps.google.com/maps/api/staticmap" +
      "?size=" + size +
      "&sensor=false" +
      "&zoom=" + zoom.to_s +
      "&markers=#{self.latitude}%2C#{self.longitude}"
  end
end
