require 'benchmark'

namespace :benchmark do
  desc "検索のベンチマーク"
  task :search => :environment do
    Benchmark.bm(7, "average:") do |x|
      results =[]
      results << x.report("type1:") {
        params = {
          lat: 35.680685897019096,
          lon: 139.76755142211914}
        result = Pin.search params
        p result.size
      }
      results << x.report("type2:") {
        params = {
          lat: 35.680685897019096,
          lon: 139.76755142211914,
          distance: 100}
        result = Pin.search params
        p result.size
      }
      results << x.report("type3:") {
        params = {
          lat: 35.680685897019096,
          lon: 139.76755142211914,
          distance: 1000}
        result = Pin.search params
        p result.size
      }
      results << x.report("type14:") {
        params = {
          search: '八重洲',
          lat: 35.680685897019096,
          lon: 139.76755142211914}
        result = Pin.search params
        p result.size
      }

      average = results.inject(:+) / results.size

      [average]
    end


  end
end
