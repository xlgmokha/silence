class Movie
  def initialize(title:,  studio: Studio::Unknown, year_published: DateTime.now.year)
  end
end

class MovieLibrary
  def add(movie)
  end
end

class Studio
  CastleRock = Object.new
  Disney = Object.new
  MiramaxFilms = Object.new
  Pixar = Object.new
  RegencyEnterprises = Object.new
  Unknown = Object.new
end
