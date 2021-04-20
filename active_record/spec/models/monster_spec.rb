require_relative "../spec_helper"
begin
  require_relative "../../app/models/monster"
rescue LoadError
end

describe "Monster" do
  before(:each) do
    create_db
    migrate
  end

  after(:each) { drop_db }

  it "class should exist. If not, you haven't defined your model class yet" do
    expect(defined?(Monster)).to eq "constant"
  end

  it "should allow to retrieve all monsters from the database" do
    if defined?(Monster)
      monsters = nil
      expect { monsters = Monster.all }.not_to raise_error, "Missing something in your class declaration maybe? Hint: inheritance"
      expect(monsters).to eq []
    else
      raise "Fix the first test before paying attention to this one"
    end
  end

  it "should allow to create monster" do
    monster = Monster.create(name: "Monster Test")
    expect { monster.name = "Monster Test" }.not_to raise_error
  end

  it "should allow to delete monster" do
    monster = Monster.create(name: "Monster Test")
    expect { monster.delete }.not_to raise_error
  end
end
