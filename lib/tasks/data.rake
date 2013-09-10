namespace :data do
  desc "テストデータの取り込み"
  task :import => :environment do
    smarter_csv_options = {
      convert_values_to_numeric: true,
      headers_in_file: true,
      col_sep: ",",
      skip_blanks: true,
      chunk_size: 100,
      header_converters: :symbol
    }

    file = "data/gps_data.csv"
    SmarterCSV.process file, smarter_csv_options do |chunk|
      chunk.each do |c|
        hash = {
          address: "#{c[:pref]}#{c[:city]}#{c[:town]}#{c[:number]}",
          latitude: c[:lat],
          longitude: c[:lon]
        }
        Pin.create hash
      end
    end
  end

  desc "ピンデータの全削除"
  task :destroy_all => :environment do
    Pin.destroy_all
  end
end
