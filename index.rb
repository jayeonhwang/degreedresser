require "http"


# puts "please enter your location:"
# location = gets.chomp
location = 60016

data = HTTP.get("http://api.weatherstack.com/current?access_key=#{ENV['API_KEY']}& query=#{location.to_i} unit=f").parse

temp = data["current"]["temperature"]
description = data["current"]["weather_descriptions"]
current_hour = data["location"]["localtime"]


if temp >= 90 
  puts '👕 🩳'
  puts description
  puts current_hour
else 
  puts '🧣'
end

#https://weatherstack.com/documentation
 