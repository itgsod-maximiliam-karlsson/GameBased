class UserRole
  include DataMapper::Resource

  property :id, Serial
  property :permission, String
  property :name, String
  property :type, String
  property :description, Text

  has 1, :user
end