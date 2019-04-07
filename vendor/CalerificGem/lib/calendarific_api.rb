require 'net/http'
require 'uri'
require 'json'

class CalendarificAPI
  def initialize(api_key)
    ##
    # Class for connecting and getting requests from Calendarific API
    @base_url = 'https://calendarific.com/api/v2/holidays?api_key=' + api_key
  end

  def get(country, year)
    # County code based on iso-3166
    # Year in format NNNN
    year = year.to_i
    if country.length == 2 and (year > 2000 and year <= 2100)
      url = URI("#{@base_url}&country=#{country}&year=#{year}")
      puts url
      JSON.parse(Net::HTTP.get(url))
    else
      raise("Argument Error on parameters")
    end
  end
end