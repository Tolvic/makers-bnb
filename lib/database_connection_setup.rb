require './lib/database_connection'

if ENV['ENVIRONMENT'] == 'test'
  DatabaseConnection.setup('makers_bnb_db_test')
else
  DatabaseConnection.setup('makers_bnb_db')
end
