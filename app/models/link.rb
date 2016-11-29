class Link
  include DataMapper::Resource

  property :id, Serial
  property :title, String
  property :url, Text

end

DataMapper.setup(:default, 'postgres://localhost/bookmark_manager_test')
DataMapper.finalize
DataMapper.auto_upgrade!
