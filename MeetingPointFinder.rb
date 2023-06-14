class MeetingPointFinder
  def initialize(board)
    @board = board
    @rows = board.length
    @cols = board[0].length
  end

  def find_meeting_point
    travelers = []
    @board.each_with_index do |row, i|
      row.each_with_index do |cell, j|
        travelers << [i, j] if cell == 1
      end
    end

    min_effort = Float::INFINITY
    meeting_point = nil

    (0...@rows).each do |i|
      (0...@cols).each do |j|
        total_effort = 0
        travelers.each do |traveler|
          x, y = traveler
          total_effort += (i - x).abs + (j - y).abs
        end
        if total_effort < min_effort
          min_effort = total_effort
          meeting_point = [i, j]
        end
      end
    end

    meeting_point
  end
end

# Test the class and method with the given example
board = [
  [1, 0, 0, 0, 1],
  [0, 0, 0, 0, 0],
  [0, 0, 1, 0, 0]
]

finder = MeetingPointFinder.new(board)
meeting_point = finder.find_meeting_point
puts meeting_point.join(', ')
