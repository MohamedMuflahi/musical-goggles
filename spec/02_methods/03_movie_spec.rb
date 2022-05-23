describe Movie do
  let(:mean_girls) { Movie.first }

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

  describe "#cast_role(actor, character_name, salary)" do
    it "creates a new `role` in the database associated with this movie and the actor" do
      rachel = Actor.create(name: "Rachel McAdams")
      role = mean_girls.cast_role(rachel, "Regina George", 1)
      expect(role).to have_attributes(
        class: Role, movie_id: mean_girls.id, actor_id: rachel.id, salary: 1, character_name: "Regina George"
      )
    end
  end

  describe "#all_credits" do
    it "returns an array of formatted strings with all the roles for this movie" do
      expect(mean_girls.all_credits).to eq([
        "Cady Heron: Played by Lindsay Lohan",
        "Ms. Norbury: Played by Tina Fey"
      ])
    end
  end

  describe "#fire_actor(actor)" do
    it "removes the actor's role from this movie (deletes the role from the database)" do
      lindsay = Actor.first
      expect { mean_girls.fire_actor(lindsay) }.to change(Role, :count).from(3).to(2)
    end
  end

end
