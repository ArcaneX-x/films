class Film
  attr_reader :title, :director, :year

  def self.read_from_dir(paths)
    paths.map do |path|
      lines = File.readlines(path, chomp: true)
      new(*lines)
    end
  end

  def initialize(title, director, year)
    @title = title.strip
    @director = director.strip
    @year = year.to_i
  end
end
