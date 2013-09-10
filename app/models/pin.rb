class Pin < ActiveRecord::Base
  include Tire::Model::Search
  include Tire::Model::Callbacks

  reverse_geocoded_by :latitude, :longitude
  # after_validation :reverse_geocode

  # マッピング設定
  tire do
    mapping do
      indexes :name, analyzer: :kuromoji
      indexes :address, analyzer: :kuromoji
      indexes :location, type: :geo_point, lat_lon: true
    end
  end

  # インデキシング用json出力
  def to_indexed_json
    {
      name: name,
      address: address,
      location: location
    }.to_json
  end

  def location
    {lat: latitude.to_f, lon: longitude.to_f}
  end

  def self.search(params)
    tire.search(load: true) do
      query {
        string "name:#{params[:search]} address:#{params[:search]}"
      } if params[:search].present?
      filter :geo_distance, {
        distance: "#{params[:distance].present? ? params[:distance].to_f : 10}km",
        location: {lat: params[:lat].to_f, lon: params[:lon].to_f}
      } if params[:lat].present? && params[:lon].present?
    end
  end

  # google map static api url構築
  def static_map_url zoom: 16, size: '600x400'
    "http://maps.google.com/maps/api/staticmap" +
      "?size=" + size +
      "&sensor=false" +
      "&zoom=" + zoom.to_s +
      "&markers=#{self.latitude}%2C#{self.longitude}"
  end
end
