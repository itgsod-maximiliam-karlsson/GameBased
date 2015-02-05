exec 'git add .'
puts 'Added this directory to git'

exec 'git commit -m "#{ARGV}"'
puts 'Going to push to Heroku and Git'

exec 'git push origin master'
puts 'push to Github Master branch'

exec 'git push heroku master'
puts 'push to Heroku'