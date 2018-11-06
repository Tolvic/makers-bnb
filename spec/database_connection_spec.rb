require 'database_connection'

describe DatabaseConnection do
  describe '.setup' do
    xit 'sets up a connection to a database through PG' do
      expect(PG).to receive(:connect).with(dbname: 'makers_bnb_db_test')

      DatabaseConnection.setup('makers_bnb_db_test')
    end

    xit 'this connection is persistent' do
      connection = DatabaseConnection.setup('makers_bnb_db_test')

      expect(DatabaseConnection.connection).to eq connection
    end
  end

  describe '.query' do
    xit 'executes a query via PG' do
      connection = DatabaseConnection.setup('makers_bnb_db_test')

      expect(connection).to receive(:exec).with("SELECT * FROM users;")

      DatabaseConnection.query("SELECT * FROM users;")
    end
  end
end
