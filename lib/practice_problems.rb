require_relative 'heap'
require_relative 'heap_sort'

def firstkNonRepeating(str, k)
    counter = Hash.new()
    str.chars.each_with_index do |char, idx|
        if !counter[char] 
            counter[char] = [1, idx]
        elsif 
            counter[char][0] += 1
            counter[char][1] = idx
        end
    end
    
    uniq = counter.select { |k,v| v[0] < 2 }
    uniq_heap = uniq.values.map {|v| v[1] }
    uniq_heap.map {|idx| str[idx]}
end

str = "ABCDBAGHCHFAC"
p firstkNonRepeating(str, 3)