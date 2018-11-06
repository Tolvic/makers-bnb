require 'bcrypt'
require './lib/database_connection'
class User

attr_reader :id, :name, :username, :telephone_number, :email_address

  def initialize(id:, name:, username:, telephone_number:, email_address:)
    @id = id
    @name = name
    @username = username
    @telephone_number = telephone_number
    @email_address = email_address
  end

  def self.create(name:, username:, telephone_number:, email_address:, password:)
    encrypted_password = BCrypt::Password.create(password)

    result = DatabaseConnection.query("INSERT INTO
      users(name, username, telephone_number, email_address, password)
      VALUES('#{name}',
        '#{username}',
        '#{telephone_number}',
        '#{email_address}',
        '#{encrypted_password}')
    RETURNING id, name, username, telephone_number, email_address;")

    User.new(id: result[0]['id'],
      name: result[0]['name'],
      username: result[0]['username'],
      telephone_number: result[0]['telephone_number'],
      email_address: result[0]['email_address'])
  end

  def self.already_registered?(email:, username:, telephone_number:)
    result = DatabaseConnection.query("SELECT * FROM users
      WHERE email_address = '#{email}' OR username = '#{username}' OR telephone_number = '#{telephone_number}'")
    result.any?
  end
end
