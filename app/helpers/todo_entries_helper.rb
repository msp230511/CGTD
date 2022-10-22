# frozen_string_literal: true

module TodoEntriesHelper
  def priority_to_string(num)
    map = {nil => "None", 3 => 'High', 2 => 'Medium', 1 => 'Low' }
    raise ArgumentError.new(
      "Got illegal priority integer. Valid values are {3,2,1, nil}, got #{num}"
    ) if !map.keys.include? num
    map[num]
  end
end
