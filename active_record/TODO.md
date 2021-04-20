## To Do list

### Deal with adding some shopkeepers to shops

Check out some other MUDs to see how shops and NPCs are handled there.

Buying method is sorta working, needs adjustments.

### Methods that are needed!!!

A helper method to find if two models are on the same maptile... something general, like 'same_tile'

* Modules have been written for some of these, they just have to be used everywhere

A method to grab items from dead bots... --> got a method to grab stuff, need a route now.

### Ideas to manage skills

When discipline warrior is chosen weapon damage is upped by 10 percent per point on that discipline.

Disciplines can have points from 1 through 10

### Map model

Map_tiles could be part of a map... how would that look?

Maybe map this out on paper, or a visual db tool...

### Schema

### Change/Adjust ShopController

In general controllers can be refactored as some methods are too long and duplicate code exists.

When adding inventory as a model though we need to adjust the shop controller so that the buy method still works.

### Refactor:

All the controllers can be re-factored. Think about moving method outputs into views and shortening methods, also move methods to private when split up.

Refactored the announce method in the bots controller today, looking good but might be possible to reduce it even further.

### Testing

would like to write some tests that cover retrieving inventory items from the db and printing them to the terminal

also some tests for grabbing items from dead bots and buying them in a store would be nice

need to make sure item counts are utilized

list of where this is important:

- grabing and droping into map

- grabing from corpses

- buying from shops

Some tests have been fixed as of June 21st, but more tests would be nice.

### Map

MapTiles could go into a map... what would that accomplish and how would that  be beneficial?

Also it would be nice to be able to only walk alleys and not across the board.

### Pet

Taming and calling a pet works, also letting the pet fight alongside of a character works. Now we need a method to replace the call pet method that maked the pet follow automatically and also give some feedback in form of output...

The pet follows now automatically, but can still be called.

Taming now gives feedback, but it would also be nice to add a "tame" ability to characters, that would be required to tame pets, perhaps with a score that gives probability of success, according to the individual pets difficulty of being tamed.

--> taming with feedback works but there is no difficulty in taming yet

### Earn Experience

Exp is now a field of the character model, but there are no rules to earn experience and level up.

An idea to earn experience would be to have a default experience point amount to gain after beating a bot, depending on bot strength and own level. --> done

Now we need to level up, perhaps some default levels would be good. --> done

level 1 --> 0 - 500 exp
level 2 --> 501 - 1100 exp
level 3 --> 1101 - 1800 exp

### Growing the app

Now that leveling works it would be nice to grow the map also add monsters and bots and maybe add some quests.

### Quests

Would this be a new object model? Or could this be something added to existing models...

What would be the parts of a quest?

  - Questmaster
  - Quest goals --> How could this be triggered/completed
  - Additional/specifc quest bots?

How do other MUDs handle this?

Probably going to make this a new model with a questmaster attached to it. --> should be done in a new branch for testing

Fields for quest model: name, length_in_minutes, reward_in_exp, goal --> this should be a descriptive string
Quests should belond to a Questmaster, which is basically a special bot that is bound to a certain maptile.

Checked out a new branch called 'quests'
Added quest and questmaster models plus migrations as of June 11th 2018, just need testing and merge now. --> merged as of June 14th

Should quests be created in the seed or should they have a seperate place to be defined in? --> solved for now

Questmasters can now be found, but are not yet clearly identified.

Once a character meets a questmaster, he should be allowed to accept a quest and a timer should start.

### Thoughts on refactoring as of June 2018

Inheritance could be an interesting topic when refatoring, to shorten code

The following methods are duplicated:

find_map_tile,

### Building Monsters

A Monster could be a new model that just sits on a maptile and automatically attacks given a certain chance.
It would need a name, description, strength, coordinates and hitpoints.

Monsters need a model, a controller and a migration
Monsters do not belong to any other model, nor do they have inventories or anything else complex as of now

ADDED monsters_controller and view, still need some methods and a route to them

### Do not forget:

Weapons damage... make shopkeepers interact,

### Issues with experience gain and leveling up

We need to level up in one place, the Level model seems like a good way to deal with it, but checking with every turn if we need to level up seems unnecessary. We should only check to level up whenever gaining some experience.

At this point refactoring becomes interesting again, as the question of inheritance and shortening code is always a hot topic.

We could either inherit all the locate bot, monster, store and all that, or have a dedicated class for locating stuff, updating models, etc.

### New Models:

Locate Model --> locate store, items on maptiles, bots, pets, monsters

Gain Experience Model

Fight Model --> fight bots and monsters

Routing Model ---> what about throwing all routes in here?

Maybe an Item and a Shop Model

A Search Model

What could be in a Pet Model?

--> Pet Models could have a follow and some method to fight and gain experience

...etc...


### Instead of new Models:

Instead of a bunch of new classes, maybe a module might be a better solution here...?

When writing modules find out what the convention says, one large modules file with several classes and mothods, or multiple seperate modules that group the required methods...

### Modules so far:

Locate

Route

Items

need to maybe be seperated in files?!

### Implementing yaml files to define objects, bots and quests instead of seed file?

It might be more convenient to implement yaml files to maintain model creation.

Look into other projects to figure out implementation.

An interesting example is an existing GitHub project that puts classes, commands and races into yaml files. Instead of MapTiles it uses 'are' files.

### Character creation and Story

We need a more robust character creation and a solid story line.

Should focus on how different skills affect the character.
