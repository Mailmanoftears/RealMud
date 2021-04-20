require_relative "../spec_helper"
begin
  require_relative "../../app/models/bot"
rescue LoadError
end

describe "Bot" do
  before(:each) do
    create_db
    migrate
  end

  after(:each) { drop_db }

  let(:inv) { Inventory.new(name: "Bag") }
  let(:bot) { Bot.create(name: "Test Bot") }

  it "class should exist. If not, you haven't defined your model class yet" do
    expect(defined?(Bot)).to eq "constant"
  end

  it "should allow to retrieve all bots from the database" do
    if defined?(Bot)
      bots = nil
      expect { bots = Bot.all }.not_to raise_error, "Missing something in your class declaration maybe? Hint: inheritance"
      expect(bots).to eq []
    else
      raise "Fix the first test before paying attention to this one"
    end
  end

  it "should allow to create a bot" do
    expect { bot.name = "Test Bot" }.not_to raise_error
  end

  it "should allow to delete a bot" do
    expect { bot.delete }.not_to raise_error
  end

  it "should allow to a bot to have an inventory" do
    bot.inventory = inv
    expect(bot.inventory.name).to eq(inv.name)
  end
end
