class Developer_role
  include DataMapper::Resource

  property :id, Serial
  property :type, String
  property :name, String
  property :description, Text

  
end