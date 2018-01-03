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
    puts "1) All Users".yellow
    puts "2) Select a Single User".yellow
    puts "3) Add a User".yellow
    puts "4) Remove a User".yellow
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
    main_menu
  end

  def select_user
    puts "Please select a user by name (first or last), or by phone number."
    choice = gets.to_i
    if choice == 1
      users = HTTParty.get("#{BASE_URL}/users/:id").parsed_response
      puts "Coming Soon! Time ran out lol"
    else
      puts "Invalid input, please choose an option or type exit to leave the application...".red
    end
  end

  def add_user
    puts "Coming Soon! Time ran out lol"
  end

  def delete_user
    puts "Coming Soon! Time ran out lol"
  end

end

Thelist.new
