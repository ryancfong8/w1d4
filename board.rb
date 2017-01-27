require_relative 'tile'
DELTAS = [[1,1], [0,1], [-1,1], [1,0], [-1,0], [-1,-1], [0,-1],[1,-1]]

class Board
  attr_accessor :grid
  def initialize
    @grid = (Array.new(2) {Array.new(9) {Tile.new(true)}} +
    Array.new(7) {Array.new(9) {Tile.new}}).shuffle
  end

  def bomb_positions
    bombs = []
    grid.each_with_index do |row, idx1|
      row.each_with_index do |tile, idx2|
          bombs << [idx1, idx2] if tile.bomb == true
        end
      end
    bombs
  end

  def bomb_neighbors(array)
    bomb_neighbors = []
    bomb_pos = array
    bomb_pos.each do |bomb|
      DELTAS.each do |coordinate|
        idx1 = bomb[0] + coordinate[0]
        idx2 = bomb[1] + coordinate[1]
        bomb_neighbors << [idx1, idx2]
      end
    end
    bomb_neighbors
  end

  def update_neighbors(array)
    bomb_neighbors = array
    bomb_neighbors.each do |neighbor_pos|
      @grid[neighbor_pos].neighbor += 1
    end
  end

  def [](pos)
    # x,y = pos
    # [x][y] = pos
    @grid[pos[0]][pos[1]]
  end
end
