describe MovieLibrary do
  let(:library) { MovieLibrary.new }
  let(:shawshank_redemption) { create_movie(title: "The Shawshank Redemption", studio: Studio::CastleRock, year_published: 1994) }
  let(:chasing_amy) { create_movie(title: "Chasing Amy", studio: Studio::MiramaxFilms, year_published: 1997) }
  let(:man_on_fire) { create_movie(title: "Man on Fire", studio: Studio::RegencyEnterprises, year_published: 2004) }
  let(:toy_story) { create_movie(title: "Toy Story", studio: Studio::Pixar, year_published: 1995) }
  let(:up) { create_movie(title: "Up", studio: Studio::Pixar, year_published: 2006) }
  let(:cars) { create_movie(title: "Cars", studio: Studio::Pixar, year_published: 2009) }
  let(:monsters_inc) { create_movie(title: "Monsters Inc.", studio: Studio::Pixar, year_published: 2001) }
  let(:fantasia) { create_movie(title: "Fantasia", studio: Studio::Disney, year_published: 1940) }
  let(:dumbo) { create_movie(title: "Dumbo", studio: Studio::Disney, year_published: 1941) }
  let(:pinocchio) { create_movie(title: "Pinocchio", studio: Studio::Disney, year_published: 1940) }
  let(:all_movies) { [shawshank_redemption, chasing_amy, man_on_fire, toy_story, up, cars, monsters_inc, fantasia, dumbo, pinocchio] }

  def create_movie(details)
    Movie.new(details)
  end

  context "when adding a movie to the library" do
    xit "increases the total number of movies in the library" do
      library.add(shawshank_redemption)
      library.add(chasing_amy)
      expect(library.total_count).to eql(2)
    end

    xit "does not allow duplicate movies into the library" do
      library.add(man_on_fire)
      library.add(man_on_fire)
      expect(library.total_count).to eql( 1)
    end

    xit 'cannot add two movies that have the same title (logically the same)' do
      library.add(create_movie(:title => 'Old School'))
      library.add(create_movie(:title => 'Old School'))
      expect(library.total_count).to eql( 1)
    end
  end

  context 'Searching for movies' do
    before :each do
      all_movies.each { |x| library.add(x) }
    end

    xit 'Can find all pixar movies' do
      results = library.find_all_movies_by_pixar
      expect(results.count).to eql(4)
      expect(results).to include(toy_story)
      expect(results).to include(up)
      expect(results).to include(cars)
      expect(results).to include(monsters_inc)
    end

    xit 'Can find all movies published by pixar or disney' do
      results = library.find_all_movies_by_pixar_or_disney
      expect(results.count).to eql(7)
      expect(results).to include(toy_story)
      expect(results).to include(up)
      expect(results).to include(cars)
      expect(results).to include(monsters_inc)
      expect(results).to include(fantasia)
      expect(results).to include(dumbo)
      expect(results).to include(pinocchio)
    end

    xit 'Can find all movies not published by pixar' do
      results = library.find_all_movies_not_published_by_pixar
      expect(results.length).to eql(6)
      expect(results).to include(fantasia)
      expect(results).to include(dumbo)
      expect(results).to include(pinocchio)
      expect(results).to include(shawshank_redemption)
      expect(results).to include(chasing_amy)
      expect(results).to include(man_on_fire)
    end

    xit 'Can find all movies released after 2004' do
      results = library.find_all_movies_published_after_2004
      expect(results.length).to eql(2)
      expect(results).to include(up)
      expect(results).to include(cars)
    end

    xit 'Can find all movies released between 1982 and 2003 - Inclusive' do
      results = library.find_all_movies_between_1982_and_2003
      expect(results.length).to eql(4)
      expect(results).to include(shawshank_redemption)
      expect(results).to include(chasing_amy)
      expect(results).to include(toy_story)
      expect(results).to include(monsters_inc)
    end
  end

  context 'Sorting movies' do
    before :each do
      all_movies.each { |x| library.add(x) }
    end

    xit 'Sorts all movies by descending title' do
      expected_order = [ cars, chasing_amy, dumbo, fantasia, man_on_fire, monsters_inc, pinocchio, shawshank_redemption, toy_story, up]
      results = library.sort_movies_by_title_descending
      expect(results).to eql(expected_order)
    end

    xit 'Sorts all movies by ascending title' do
      expected_order = [up, toy_story, shawshank_redemption, pinocchio, monsters_inc, man_on_fire, fantasia, dumbo, chasing_amy, cars]
      results = library.sort_movies_by_title_ascending
      expect(results).to eql( expected_order)
    end

    xit 'Sorts all movies by descending release date' do
      expected_order = [cars, up, man_on_fire, monsters_inc, chasing_amy, toy_story, shawshank_redemption, dumbo, fantasia, pinocchio ]
      results = library.sort_movies_by_descending_release_date
      expect(results).to eql( expected_order )
    end

    xit 'Sorts all movies by ascending release date' do
      expected_order = [pinocchio, fantasia, dumbo, shawshank_redemption, toy_story, chasing_amy, monsters_inc, man_on_fire, up, cars]
      results = library.sort_movies_by_ascending_release_date
      expect(results).to eql( expected_order )
    end

    xit 'Sorts all movies by preferred studios and release date ascending' do
      #rankings: Pixar, Disney, CastleRock, MiramaxFilms, RegenceyEnterprises
      expected_order = [ toy_story, monsters_inc, up, cars, fantasia, pinocchio, dumbo, shawshank_redemption, chasing_amy, man_on_fire]
      results = library.sort_movies_by_preferred_studios_and_release_date_ascending
      expect(results).to eql( expected_order )
    end
  end

  context "equality" do
    xit "is not equal" do
      blah = create_movie(title: 'blah')
      huh = create_movie(title: 'huh')
      expect(blah).to eql( huh )
    end

    xit "is equal" do
      huh1 = create_movie(title: 'huh')
      huh2 = create_movie(title: 'huh')
      expect(huh1).to eql( huh2 )
    end
  end
end
