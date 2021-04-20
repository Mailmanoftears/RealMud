require_relative "../spec_helper"
begin
  require_relative "../../app/models/character"
rescue LoadError
end

describe "Character" do
  before(:each) do
    create_db
    migrate
  end

  after(:each) { drop_db }

  it "class should exist. If not, you haven't defined your model class yet" do
    expect(defined?(Character)).to eq "constant"
  end

  it "should allow to retrieve all characters from the database" do
    if defined?(Character)
      characters = nil
      expect { characters = Character.all }.not_to raise_error, "Missing something in your class declaration maybe? Hint: inheritance"
      expect(characters).to eq []
    else
      raise "Fix the first test before paying attention to this one"
    end
  end
end
