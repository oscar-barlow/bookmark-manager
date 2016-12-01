require_relative 'link.rb'
require_relative 'tag.rb'



module DatamapperSetup

  def dm_setup
    DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")
    DataMapper.finalize
    DataMapper.auto_upgrade!
  end

end
