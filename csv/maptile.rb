class MapTile
  attr_reader :coords, :info, :items
  attr_writer :items

  def initialize(coords, info, items={})
    @coords = coords
    @info = info
    @items = items
  end

  def all
    # currently not in use
  end
end
