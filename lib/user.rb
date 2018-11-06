require 'database_connection'
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

    result = DatabaseConnection.query("INSERT INTO
      users(name, username, telephone_number, email_address, password)
      VALUES('#{name}',
        '#{username}',
        '#{telephone_number}',
        '#{email_address}',
        '#{password}')
    RETURNING id, name, username, telephone_number, email_address;")

    User.new(id: result[0]['id'],
      name: result[0]['name'],
      username: result[0]['username'],
      telephone_number: result[0]['telephone_number'],
      email_address: result[0]['email_address'])
  end
end



 def self.create(first_name:, last_name:, username:, email:, password:)
   encrypted_password = BCrypt::Password.create(password)

   result = DatabaseConnection.query("INSERT INTO
     users(firstname, lastname, username, email, password)
     VALUES('#{first_name}',
       '#{last_name}',
       '#{username}',
       '#{email}',
       '#{encrypted_password}')
   RETURNING id, firstname, lastname, username, email;")

   User.new(id: result[0]['id'],
     first_name: result[0]['firstname'],
     last_name: result[0]['lastname'],
     username: result[0]['username'],
     email: result[0]['email'])
 end
