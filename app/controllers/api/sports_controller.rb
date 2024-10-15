class Api::SportsController < ApplicationController
  def index
    url = URI("https://betbro-sportbook.p.rapidapi.com/fixture_tree/InPlay/sport/1")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request["x-rapidapi-key"] = '3ea60ece5cmshd581109661d145fp115f24jsn44b326e1951f'
    request["x-rapidapi-host"] = 'betbro-sportbook.p.rapidapi.com'

    response = http.request(request)

    begin
      @sports = JSON.parse(response.read_body)
    rescue JSON::ParserError => e
      puts "JSON Parse Error: #{e.message}"
      @sports = [] 
    end

    render 'api/sports/index' 
  end
end
