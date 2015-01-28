class Seeder

  def self.seed
    self.games
    self.languages
    self.translations
  end

  def self.games
    Game.create(name: 'Counter Strike', description: 'A FPS video game.',
                base_language_id: 1, release_date: '19/6/1999', rating: 7)
    Game.create(name: 'Team Fortress 2', description: 'A team based FPS video game.',
                base_language_id: 1, release_date: '9/10/2007', rating: 6)
  end

  def self.languages
    Language.create(name: 'English')
    Language.create(name: 'Swedish')
    Language.create(name: 'Finnish')
    Language.create(name: 'Russian')
    Language.create(name: 'Japanese')
  end

  def self.translations
    Translation.create(game_id: 1, language_id: 2)
    Translation.create(game_id: 1, language_id: 3)
    Translation.create(game_id: 1, language_id: 4)

    Translation.create(game_id: 2, language_id: 2)
    Translation.create(game_id: 2, language_id: 3)
    Translation.create(game_id: 2, language_id: 5)
  end
end