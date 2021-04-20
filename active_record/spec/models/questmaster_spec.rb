require_relative "../spec_helper"
begin
  require_relative "../../app/models/questmaster"
rescue LoadError
end

describe "QuestMaster" do
  before(:each) do
    create_db
    migrate
  end

  after(:each) { drop_db }

  let(:master) { QuestMaster.new(name: "Legolas", race: "Elf", y_coord: 0) }
  let(:quest) { Quest.new(name: "Test Quest", length_in_minutes: 15, reward_in_exp: 50) }

  it "class should exist. If not, you haven't defined your model class yet" do
    expect(defined?(QuestMaster)).to eq "constant"
  end

  it "class should exist. If not, you haven't defined your model class yet" do
    expect(defined?(Quest)).to eq "constant"
  end

  it "should allow to retrieve all questmasters from the database" do
    if defined?(QuestMaster)
      questmasters = nil
      expect { questmasters = QuestMaster.all }.not_to raise_error, "Missing something in your class declaration maybe? Hint: inheritance"
      expect(questmasters).to eq []
    else
      raise "Fix the first test before paying attention to this one"
    end
  end

  it "should allow to let a questmaster have a quest" do
    master.quest = quest
    expect(master.quest.name).to eq quest.name
  end
end
