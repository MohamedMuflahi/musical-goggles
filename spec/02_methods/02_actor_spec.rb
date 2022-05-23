describe Actor do
  let(:lindsay_lohan) { Actor.first }

  before do
    lindsay_lohan = Actor.create(name: "Lindsay Lohan")
    baby_spice = Actor.create(name: "Emma Bunton")
    
    mean_girls = Movie.create(title: "Mean Girls", box_office_earnings: 129_000_000)
    machete = Movie.create(title: "Machete", box_office_earnings: 44_000_000)
    spice_world = Movie.create(title: "Spice World", box_office_earnings: 151_000_000)
    
    Role.create(salary: 100, character_name: "Cady Heron", movie_id: mean_girls.id, actor_id: lindsay_lohan.id)
    Role.create(salary: 20, character_name: "April", movie_id: machete.id, actor_id: lindsay_lohan.id)
    Role.create(salary: 30, character_name: "Baby Spice", movie_id: spice_world.id, actor_id: baby_spice.id)
  end


  it "has a name" do
    expect(lindsay_lohan).to have_attributes(name: "Lindsay Lohan")
  end

  describe "#total_salary" do
    it "returns the total salary for an actor based on the salary for each of their roles" do
      expect(lindsay_lohan.total_salary).to eq(120)
    end
  end

  describe "#blockbusters" do
    it "returns a collection of all the `Movie` instances the actor has performed in that have a `box_office_earnings` of over $50,000,000" do
      expect(lindsay_lohan.blockbusters).to eq([Movie.first])
    end
  end

  describe ".most_successful" do
    it "returns _one_ actor instance for the actor who has the highest total salary for all their roles" do
      expect(Actor.most_successful).to eq(lindsay_lohan)
    end
  end

end
