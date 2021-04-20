require "pry-byebug"
require "rainbow"

require_relative "../spec_helper"
begin
  require_relative "../../app/config/run"
rescue LoadError
end

describe "PetController" do
  before(:each) do
    create_db
    migrate
  end

  after(:each) { drop_db }

  let(:char) { Character.new(name: "Jo", race: "Elf", x_coord: 0, y_coord: 0) }
  let(:pet) { Pet.new(name: "Fluffy", x_coord: 0, y_coord: 0) }
  let(:pet_controller) { PetController.new }

  it "should allow a pet that belongs to a character to be called" do
    char.pet = pet
    expect(pet_controller.call(char)).to eq(pet)
  end
end
