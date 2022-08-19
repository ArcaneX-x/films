class Question
  attr_reader :version

  def initialize(film, directors)
    @film = film
    @directors = directors
    @version = (@directors - [@film.director]).sample(3).push(@film.director)
  end

  def print_versions
    @version.shuffle!
  end

  def right_answer?(user_answer)
    @version[user_answer - 1] == @film.director
  end
end
