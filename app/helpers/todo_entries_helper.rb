# frozen_string_literal: true

module TodoEntriesHelper
  def priority_to_string(num)
    map = { nil => 'None', 3 => 'High', 2 => 'Medium', 1 => 'Low' }
    unless map.keys.include? num
      raise ArgumentError, "Got illegal priority integer. Valid values are {3,2,1, nil}, got #{num}"
    end

    map[num]
  end
end
