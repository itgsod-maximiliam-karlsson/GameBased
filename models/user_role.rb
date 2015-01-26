class User_role
  include DataMapper::Resource

  property :id, Serial
  property :permission, String
  property :name, String
  property :type, String
  property :description, Text

  belongs_to :user
end