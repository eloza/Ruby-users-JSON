# Reads information from user and permissions then prints to a file
require 'json'

class User
  attr_accessor :name, :email
  
  def initialize(name, email)  
    @name = name
    @email = email
	@permissions = read_permissions
  end
  
  def read_permissions
    JSON.load(File.read('user_permissions_template.json'))
  end
  
  # Save content to a file then convert to JSON object
  def save
    self_json = {name: @name, email: @email, permissions: @permissions}.to_json
    File.open('users.json', 'a') do |f|
      f.puts self_json
    end
  end
end