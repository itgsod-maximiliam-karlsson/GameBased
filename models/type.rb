class Type
  include DataMapper::Resource

  property :id, Serial
  property :type, String
  property :description, Text

  belongs_to :company
end