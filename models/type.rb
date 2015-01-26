class Type
  include DataMapper::Resource

  property :id, Serial
  property :type, String
  property :descrition, Text

  belongs_to :company
end