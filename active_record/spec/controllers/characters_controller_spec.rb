require "pry-byebug"

require_relative "../spec_helper"
begin
  require_relative "../../app/config/run"
rescue LoadError
end

describe "CharacterController" do
  before(:each) do
    create_db
    migrate
    MapTile.create(name: "Town Center", description: "The busy town's center", x_coord: 0, y_coord: 0)
    MapTile.create(name: "Road", description: "Just a dusty road", x_coord: 0, y_coord: 1)
  end

  after(:each) { drop_db }

  let(:char_controller) { CharactersController.new }
  let(:char) { Character.new(name: "Jo", race: "Elf", x_coord: 0, y_coord: 0) }

  it "list should return all characters" do
    # binding.pry
    expect(char_controller.index).to eq(Character.all)
  end

  it "should allow to move an existing character" do
    # binding.pry
    char_controller.move_char(char, "n")
    expect(char.y_coord).to eq(1)
  end
end
