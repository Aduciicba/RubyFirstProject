#!/usr/bin/ruby
require 'json'

config_file_name = 'F:\config.json'

def OpenFile(file_name)
  File.read(file_name)
rescue SystemCallError
  raise "Config file #{file_name} not found"
end

def GetJSON(file_str)
  json = JSON.parse(file_str)
rescue => err
  raise "Error parsing JSON in config file: #{err}"
end

def CheckUserPassword(user_data, login, password)
  message = ''
  has_such_user = false
  is_correct_password = false

  user_data['users_auth_data'].each { |user|
    if user['login'].to_s == login
      has_such_user = true
      if user['password'].to_s == password
        is_correct_password = true
      end
      break
    end
  }

  message = 'Sorry, we\'re not familiar yet:)' if !has_such_user
  message = 'Sorry, your password is wrong:('  if  has_such_user and !is_correct_password
  message = "Welcome, #{login}!"               if  has_such_user and  is_correct_password
  message
end

json_file = OpenFile(config_file_name)
user_auth_data = GetJSON(json_file)

begin
  puts 'Hellow! Input your login:'
  input_login = gets.chomp
  raise if input_login.to_s.length > 20
rescue
  puts "Your login is too large! Try again.." if input_login.to_s.length > 20
  retry
end

puts 'Good, now input your password:'
input_password = gets.chomp

puts CheckUserPassword(user_auth_data, input_login, input_password)







