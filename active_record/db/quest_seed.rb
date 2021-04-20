# What would a new quest look like?

Quest.create(name: 'Test quest', length_in_minutes: 15, reward_in_exp: 220, description: 'Just a test quest', solved: false)

QuestMaster.create(name: 'Laboras', race: 'Human', x_coord: 3, y_coord: -2, alive: true)

Quest.first.quest_master = QuestMaster.first
