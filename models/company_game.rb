class CompanyGame
  include DataMapper::Resource

  belongs_to :company, :key => true
  belongs_to :game, :key => true
end