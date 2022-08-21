require_relative 'lib/film'
require_relative 'lib/question'

QUESTION_NUMBER = 3

paths = Dir[File.join(__dir__, 'data', '*.txt')]

films = paths.map do |path|
  lines = File.readlines(path, chomp: true)
  Film.new(*lines)
end

puts 'Добрый день, любитель кино!'
puts 'Давай посмотрим, хорошо ли ты знаешь какой режиссер какой фильм снял?'

points = 0

directors = films.map(&:director)

films.sample(QUESTION_NUMBER).each do |film|
  question = Question.new(film, directors)

  puts "\n Кто снял '#{film.title}' (#{film.year} год)?"

  question.options.each.with_index(1) { |version, index| puts "#{index}. #{version}" }

  user_answer = $stdin.gets.to_i

  until user_answer.between?(1, 4)
    puts 'Введите число от 1 до 4'
    user_answer = $stdin.gets.to_i
  end

  director = question.options[user_answer - 1]
  puts director

  if question.answer_is_correct?(director)
    puts "\nВерно."
    points += 1
  else
    puts "\nНеверно :( Правильный ответ #{film.director}"
  end
end

puts "\nУ вас #{points} правильных ответа из #{QUESTION_NUMBER}"
