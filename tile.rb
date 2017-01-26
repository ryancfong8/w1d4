class Tile
attr_reader :bomb
attr_accessor :neighbors, :flagged, :hidden

  def initialize(bomb = false)
    @bomb = bomb
    @neighbors = 0
    @flagged = false
    @hidden = true
  end

end
