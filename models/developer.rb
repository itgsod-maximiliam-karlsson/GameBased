class Developer
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :description, Text

  has n, :game
  has n, :developer_role
end