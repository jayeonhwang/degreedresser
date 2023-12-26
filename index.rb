require "http"

<<<<<<< HEAD
puts "   _                       _                         
_| |___ ___ ___ ___ ___ _| |___ ___ ___ ___ ___ ___ 
| . | -_| . |  _| -_| -_| . |  _| -_|_ -|_ -| -_|  _|
|___|___|_  |_| |___|___|___|_| |___|___|___|___|_|  
       |___|                                        "

puts "please enter your location:"
location = gets.chomp

data = HTTP.get("http://api.weatherstack.com/current?access_key=#{ENV['API_KEY']}&query= #{location}&units=f").parse
=======

# puts "please enter your location:"
# location = gets.chomp
location = 60016

data = HTTP.get("http://api.weatherstack.com/current?access_key=#{ENV['API_KEY']}& query=#{location.to_i} unit=f").parse
>>>>>>> 3f43ffea988e6237d101dfaf116bd053aa16c6c6

temp = data["current"]["temperature"]
description = data["current"]["weather_descriptions"]
current_hour = data["location"]["localtime"]
<<<<<<< HEAD
city_name = data["location"]["name"]

puts city_name
puts current_hour
puts description
puts temp

if temp >= 90 
  puts ' 🩳 🧢 👙 🕶️ 👚'

elsif temp >= 70
  puts ' 🩳 👕 🧢'

elsif temp >= 65
  puts'👕 👖 👟'

elsif temp >= 50
  puts' 👔 👖 👟'

elsif temp>= 40
  puts'👔 👖 🥼 🧦 👟'

elsif temp>= 30
  puts '👔 👖 🥼 🧥 🧦 🥾'

elsif temp>= 20
  puts'👔 👖 🧥 🧦 🧣 🥾 👢'

else 
  puts '👔 👖 🧥 🧦 🧣 🥾 👢 🧤'
end



=======


if temp >= 90 
  puts '👕 🩳'
  puts description
  puts current_hour
else 
  puts '🧣'
end

#https://weatherstack.com/documentation
>>>>>>> 3f43ffea988e6237d101dfaf116bd053aa16c6c6
 