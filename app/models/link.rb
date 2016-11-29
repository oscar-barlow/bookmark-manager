class Link
  include DataMapper::Resource

  property :id, Serial
  property :title, String
  property :url, Text

end
