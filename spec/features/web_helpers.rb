require 'data_mapper'
require 'dm-postgres-adapter'

def setup_postgres_database
  DataMapper.setup(:default, 'postgres://localhost/bookmark_manager')
  DataMapper::Logger.new($stdout, :debug)
end
