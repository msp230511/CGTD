module TodoEntriesHelper
    def priority_to_string(num)
        map = {3=>"High", 2=>"Medium", 1=>"Low"}
        map[num]
    end
end
