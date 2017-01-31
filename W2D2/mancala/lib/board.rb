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
      next if i == 6 || i == 13
      @cups[i] = Array.new(4) { :stone }
    end

  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" unless start_pos.between?(1, 6)
  end

  def make_move(start_pos, current_player_name)
    stones =  @cups[start_pos]
    @cups[start_pos] = []

    if current_player_name == @name1
      ignore_pos = 13
    else
      ignore_pos = 6
    end

    next_pos = start_pos

    until stones.empty?
      next_pos = (next_pos + 1) % 14
      next if next_pos == ignore_pos

      @cups[next_pos] << stones.pop
    end

    render
    next_turn(next_pos)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].length == 1
      :switch
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
