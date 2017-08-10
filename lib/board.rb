class Board
  attr_reader :board, :size

  DEFAULT_SIZE     = 9
  HORIZONTAL_INDEX = [0, 1, 2, 3, 4, 5, 6, 7, 8].freeze
  VERTICAL_INDEX   = [0, 3, 6, 1, 4, 7, 2, 5, 8].freeze
  DIAGONAL_INDEX   = [0, 4, 8, 2, 4, 6, 9, 9, 9].freeze

  def initialize(size = DEFAULT_SIZE)
    @size = size
    @board = Array.new(size)
  end

  def move(player_symbol, position)
    check_valid_move(position)
    board[position] = player_symbol
  end

  def winner?(player_symbol)
    return true if check_horizontal(player_symbol)
    return true if check_vertical(player_symbol)
    return true if check_diagonal(player_symbol)
    false
  end

  private

  def check_valid_move(position)
    raise 'Out of Bounds' unless position.between? 0, size
    raise 'Invalid Move' unless board[position].nil?
  end

  def check_horizontal(player_symbol)
    split(HORIZONTAL_INDEX).each { |h| return true if line? h, player_symbol }
    false
  end

  def check_vertical(player_symbol)
    split(VERTICAL_INDEX).each { |h| return true if line? h, player_symbol }
    false
  end

  def check_diagonal(player_symbol)
    split(DIAGONAL_INDEX).each { |h| return true if line? h, player_symbol }
    false
  end

  def line?(array, player_symbol)
    array.all? { |value| value == player_symbol }
  end

  def split(i)
    [
      board.values_at(i[0], i[1], i[2]),
      board.values_at(i[3], i[4], i[5]),
      board.values_at(i[6], i[7], i[8])
    ]
  end
end
