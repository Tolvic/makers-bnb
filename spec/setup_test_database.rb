# in spec/setup_test_database.rb

def setup_test_database
  require 'pg'

  p "Setting up test database..."

  connection = PG.connect(dbname: 'makers_bnb_db_test')

  # Clear the messages table
  # connection.exec("TRUNCATE users, spaces;")
end
