describe Movie do
  let(:movie) { Movie.first }

  before do
    mean_girls = Movie.create(title: "Mean Girls", box_office_earnings: 129_000_000)
    spice_world = Movie.create(title: "Spice World", box_office_earnings: 151_000_000)
    lindsay_lohan = Actor.create(name: "Lindsay Lohan")
    tina_fey = Actor.create(name: "Tina Fey")
    baby_spice = Actor.create(name: "Emma Bunton")
    Role.create(salary: 1, character_name: "Cady Heron", movie_id: mean_girls.id, actor_id: lindsay_lohan.id)
    Role.create(salary: 2, character_name: "Ms. Norbury", movie_id: mean_girls.id, actor_id: tina_fey.id)
    Role.create(salary: 3, character_name: "Baby Spice", movie_id: spice_world.id, actor_id: baby_spice.id)
  end


  it "has a title and box office earnings" do
    expect(movie).to have_attributes(title: "Mean Girls", box_office_earnings: 129_000_000)
  end

  describe "#roles" do
    it "returns a collection of all the roles for the movie" do
      expect(movie.roles.count).to eq(2)
    end
  end

  describe "#actors" do
    it "returns a collection of all the actors who performed in the movie" do
      expect(movie.actors.count).to eq(2)
    end
  end

end
