# What would a new quest look like?

Quest.create(name: 'Fake Necromancer', length_in_minutes: 15, reward_in_exp: 300, description: 'You can spend this exp to cross over into necromancer city.', solved: false)

QuestMaster.create(name: 'Laboras', race: 'Human', x_coord: 3, y_coord: -2, alive: true)

# Bind quest with their QuestMaster
Quest.first.quest_master = QuestMaster.first
