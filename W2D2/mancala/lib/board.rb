class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14){ [] }
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups[0..12].each_index do |i|
      next if i == 6
      @cups[i] = Array.new(4) { :stone }
    end

  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" unless start_pos.between?(1, 6)
  end

  def make_move(start_pos, current_player_name)
    len = @cups[start_pos].length
    stones = []
    len.times{ stones << @cups[start_pos].pop }

    next_pos = start_pos

    ignore_num = 13

    until stones.empty?
      next_pos = (next_pos + 1) % 13
      # puts "next_pos is #{next_pos}"
      next if next_pos == ignore_num

      @cups[next_pos] << stones.pop
    end

    render
    next_turn((next_pos + 1) % 13)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    # puts "ending_cup_idx #{ending_cup_idx}"
    if @cups[ending_cup_idx].empty?
      :switch
    elsif ending_cup_idx == 6
      :prompt
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    (0..6).all?{ |i| @cups[i].empty? } ||
    (7..13).all?{ |i| @cups[i].empty? }
  end

  def winner
    return :draw if @cups[6].length == @cups[13].length
    return @cups[6].length > @cups[13].length ? @name1 : @name2
  end
end


# board = Board.new("name1", "name2")
# board.make_move(0, "Erica")
#
# board.make_move(10, "James")
# board.cups[6] = [:stone, :stone, :stone, :stone, :stone, :stone]
# board.cups[13] = [:stone, :stone, :stone, :stone, :stone]
# p board.winner
# b.make_move(12, "Erica")
# p b.cups[13]
# p b.cups[3]
