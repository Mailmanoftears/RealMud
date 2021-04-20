a = Character.new(name: "Mygdin", race: "Elf", hitpoints: 28, strength: 7, x_coord: 2, y_coord: 2)
a.save
b = Character.new(name: "Govin", race: "Elf", hitpoints: 26, strength: 6, x_coord: 0, y_coord: 0)
b.save
c = Character.new(name: "Donder", race: "Human", hitpoints: 22, strength: 9, x_coord: 0, y_coord: 0)
c.save
d = Character.new(name: "Glimli", race: "Dwarf", hitpoints: 30, strength: 11, x_coord: 0, y_coord: 0)
d.save
e = Character.new(name: "Ormir", race: "Orc", hitpoints: 32, strength: 12, x_coord: 0, y_coord: 0)
e.save

one = InventoryItem.new(name: "Dagger", amount: 1)
one.character = Character.find(1)
one.save
two = InventoryItem.new(name: "Coins", amount: 24)
two.character = Character.find(1)
two.save
three = InventoryItem.new(name: "Sword", amount: 1)
three.character = Character.find(2)
three.save
four = InventoryItem.new(name: "Apple", amount: 3)
four.character = Character.find(3)
four.save
five = InventoryItem.new(name: "Axe", amount: 1)
five.character = Character.find(4)
five.save
six = InventoryItem.new(name: "Axe", amount: 2)
six.character = Character.find(5)
six.save

Pet.create(name: "Smitty", kind: "Racoon", description: "A shaggy looking rodent", x_coord: 0, y_coord: 0)

Bot.create(name: "Zorb", race: "Goblin", hitpoints: 24, strength: 8, x_coord: 0, y_coord: 1)

x = MapTile.new(name: "Town Center", description: "The busy town's center", x_coord: 0, y_coord: 0)
x.save
y = MapTile.new(name: "Road", description: "Just a dusty road", x_coord: 0, y_coord: 1)
y.save
z = MapTile.new(name: "Road", description: "Just a dusty road", x_coord: 0, y_coord: -1)
z.save
o = MapTile.new(name: "Road", description: "Just a dusty road", x_coord: 0, y_coord: 2)
o.save
q = MapTile.new(name: "Road", description: "Just a dusty road", x_coord: 0, y_coord: -2)
q.save
r = MapTile.new(name: "Road", description: "Just a dusty road", x_coord: 1, y_coord: 0)
r.save
s = MapTile.new(name: "Road", description: "Just a dusty road", x_coord: 1, y_coord: 1)
s.save
t = MapTile.new(name: "Town Square", description: "The town's shitty square", x_coord: 1, y_coord: -1)
t.save
u = MapTile.new(name: "Bar and Tavern", description: "Rusty's bar and tavern", x_coord: 1, y_coord: 2)
u.save
v = MapTile.new(name: "Temple", description: "Temple of Samael", x_coord: 1, y_coord: -2)
v.save
w = MapTile.new(name: "Road", description: "Just a dusty road", x_coord: 2, y_coord: 0)
w.save
m = MapTile.new(name: "Road", description: "Just a dusty road", x_coord: 2, y_coord: 1)
m.save
n = MapTile.new(name: "Road", description: "Just a dusty road", x_coord: 2, y_coord: -1)
n.save
xy = Shop.new(name: "Dusty Shop", description: "Get your gear here")
xy.save
money = two = InventoryItem.new(name: "Coins", amount: 0)
money.shop = Shop.find(1)
money.save
stuff = InventoryItem.new(name: "Bread", amount: 3, value: 5)
stuff.shop = Shop.find(1)
stuff.save
some = InventoryItem.new(name: "Staff", amount: 1, value: 25)
some.shop = Shop.find(1)
some.save
more = InventoryItem.new(name: "Bow", amount: 1, value: 35)
more.shop = Shop.find(1)
more.save
things = InventoryItem.new(name: "Arrows", amount: 23, value: 5)
things.shop = Shop.find(1)
things.save
k = MapTile.new(name: "General Store", description: "Dusty's Shoppe", x_coord: 2, y_coord: 2)
k.shop = Shop.find(1)
k.save
l = MapTile.new(name: "Fighting Arena", description: "Molnir's Arena", x_coord: 2, y_coord: -2)
l.save
i = MapTile.new(name: "Road", description: "Just a dusty road", x_coord: 3, y_coord: 0)
i.save
j = MapTile.new(name: "Road", description: "Just a dusty road", x_coord: 3, y_coord: 1)
j.save
g = MapTile.new(name: "Road", description: "Just a dusty road", x_coord: 3, y_coord: -1)
g.save
h = MapTile.new(name: "Bookstore", description: "Logolas bookstore", x_coord: 3, y_coord: 2)
h.save
f = MapTile.new(name: "Library", description: "The town's public library", x_coord: 3, y_coord: -2)
f.save

