require_relative "../spec_helper"
begin
  require_relative "../../app/models/pet"
rescue LoadError
end

describe "Pet" do
  before(:each) do
    create_db
    migrate
  end

  after(:each) { drop_db }

  let(:char) { Character.new(name: "Jo", race: "Elf", y_coord: 0) }
  let(:pet) { Pet.new(name: "Smo", kind: "Cat", y_coord: 0) }

  it "class should exist. If not, you haven't defined your model class yet" do
    expect(defined?(Pet)).to eq "constant"
  end

  it "should allow to retrieve all characters from the database" do
    if defined?(Pet)
      pets = nil
      expect { pets = Pet.all }.not_to raise_error, "Missing something in your class declaration maybe? Hint: inheritance"
      expect(pets).to eq []
    else
      raise "Fix the first test before paying attention to this one"
    end
  end

  it "should allow to let a character have a pet" do
    char.pet = pet
    expect(char.pet.name).to eq pet.name
  end
end
