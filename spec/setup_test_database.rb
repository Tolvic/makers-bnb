# in spec/setup_test_database.rb

def setup_test_database
  require 'pg'

  p "Setting up test database..."

  connection = DatabaseConnection.setup('makers_bnb_db_test')

  connection.exec("TRUNCATE bookings, users, spaces;")
end
