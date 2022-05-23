describe Actor do
  let(:actor) { Actor.first }

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


  it "has a name" do
    expect(actor).to have_attributes(name: "Lindsay Lohan")
  end

  describe "#roles" do
    it "returns a collection of all the roles that the actor has played" do
      expect(actor.roles.count).to eq(1)
    end
  end

  describe "#movies" do
    it "returns a collection of all the movies that the actor has performed in" do
      expect(actor.movies.count).to eq(1)
    end
  end

end
