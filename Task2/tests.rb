def twins(a, b)
    result = []
    a_odd = []
    a_even = []
    b_odd = []
    b_even = []
    
    a.each_with_index do |item, index|
        a_odd[index], a_even[index] = item.chars.partition.with_index{ |item, index| index.odd? }
        a_odd[index].sort!
        a_even[index].sort!
    end
    b.each_with_index do |item, index|
        b_odd[index], b_even[index] = item.chars.partition.with_index{ |item, index| index.odd? }
        b_odd[index].sort!
        b_even[index].sort!
    end
    
    0.upto(a.length - 1) do |index|
        if a_odd[index] == b_odd[index] and a_even[index] == b_even[index]
            result[index] = "YES"
        else
            result[index] = "NO"
        end
    end
    return result
end

_a = %w{dog string lemon}
_b = %w{god rtsgni elmon}

res = twins(_a, _b);
for res_i in res do
  puts res_i
end