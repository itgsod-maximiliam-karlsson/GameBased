class Seeder

  def self.seed
    game
  end

  def self.game
    Game.create(
        name: 'Counter Strike',
        description: 'Test game',
        tags: 'Action, Horror',
        language: 'English, Japanese',
        release_date: '11/11/11',
        rating: 7
    )
  end
end