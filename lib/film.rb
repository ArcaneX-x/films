class Film
  attr_reader :title, :director, :year

  def initialize(title, director, year)
    @title = title.strip
    @director = director.strip
    @year = year.strip
  end
end
