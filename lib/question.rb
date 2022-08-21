class Question
  attr_reader :film, :directors, :options
  def initialize(film, directors)
    @film = film
    @directors = directors
  end

  def answer_is_correct?(user_answer)
    user_answer == correct_answer
  end

  def correct_answer
    film.director
  end

  def options
    @options ||= (question_options.sample(3) << film.director).shuffle
  end

  private

  def question_options
    directors.uniq - Array(film.director)
  end
end
