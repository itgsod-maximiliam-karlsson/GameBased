class Membership
  include DataMapper::Resource

  property :id, Serial
  property :permission, String
  property :description, Text

  has n, :users
end