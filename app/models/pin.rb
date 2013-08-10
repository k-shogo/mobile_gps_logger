class Pin < ActiveRecord::Base
  reverse_geocoded_by :latitude, :longitude
  # after_validation :reverse_geocode

  def static_map_url

    "http://maps.google.com/maps/api/staticmap?size=600x400&sensor=false&zoom=16&markers=#{self.latitude}%2C#{self.longitude}"
  end
end
