# connects the app to the database

module ConnectApptoDB

  def ConnectApptoDB.start_db_connection
    DataMapper::Logger.new($stdout, :debug)
    DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")
    DataMapper.finalize
  end

end
