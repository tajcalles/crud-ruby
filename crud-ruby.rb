require 'httparty'
require 'pry'
require 'colorize'

BASE_URL = "http://json-server.devpointlabs.com/api/v1"

class Thelist

  def initialize
    puts "****WELCOME TO THE LIST****".green
    main_menu
  end

  def main_menu
    puts "Please select an option:"
    choice = gets.to_i
    case choice
      when 1
        all_users
      when 2
        select_user
      when 3
        add_user
      when 4
        delete_user
      when 5
        exit 0
      else
        puts "Invalid Choice, Please Select An Option"
        main_menu
      end
  end

  def all_users
    users = HTTParty.get("#{BASE_URL}/users").parsed_response
    users.each do |user|
      puts user['id']
      puts user['first_name']
      puts user['last_name']
      puts user['phone_number']
  end

  def select_user
    puts "Please select a user by name (first or last), or by phone number."
  end

  def add_user
  end

  def delete_user
  end
end
end

Thelist.new
