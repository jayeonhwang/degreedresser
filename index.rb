require "http"
require "pastel"
require "tty-box"

pastel =Pastel.new

puts pastel.magenta("   _                       _                         
_| |___ ___ ___ ___ ___ _| |___ ___ ___ ___ ___ ___ 
| . | -_| . |  _| -_| -_| . |  _| -_|_ -|_ -| -_|  _|
|___|___|_  |_| |___|___|___|_| |___|___|___|___|_|  
       |___|                                        ")

puts pastel.blue("please enter your location (city name or zip code):")
location = gets.chomp 


data = HTTP.get("http://api.weatherstack.com/current?access_key=#{ENV['API_KEY']}&query= #{location}&units=f").parse
temp = data["current"]["temperature"]
description = data["current"]["weather_descriptions"]
current_hour = data["location"]["localtime"]
city_name = data["location"]["name"]



def weather(desc)
  string_desc = desc[0]
  
  if string_desc.downcase.include?("rain")
    return '🌧️'
  elsif string_desc.downcase.include?("rain")
    return '🌨️'
  end
end


def clothes(degree)
  if degree >= 90 
    return ' 🩳 🧢 👙 🕶️ 👚'
    
  elsif degree >= 70
    return ' 🩳 👕 🧢'
    
  elsif degree >= 65
    return'👕 👖 👟'
    
  elsif degree >= 50
    return' 👔 👖 👟'
    
  elsif degree>= 40
    return'👔 👖 🥼 🧦 👟'
    
  elsif degree>= 30
    return '👔 👖 🥼 🧥 🧦 🥾'
    
  elsif degree>= 20
    return'👔 👖 🧥 🧦 🧣 🥾 👢'
    
  else 
    return '👔 👖 🧥 🧦 🧣 🥾 👢 🧤'
  end
end



box = TTY::Box.frame(width: 50, height: 10, border: :thick, align: :center, padding: 2, title: {top: "#{city_name}"}) do
"#{current_hour}\n#{description[0]}\n#{weather(description)}\n#{temp}\n#{clothes(temp)}"
end

puts box