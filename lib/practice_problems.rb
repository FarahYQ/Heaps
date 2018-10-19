require_relative 'heap'
require_relative 'heap_sort'

# need to complete code
def firstkNonRepeating(str, k)
    counter = Hash.new([0,""])
    str.chars.each_with_index do |char, idx| 
        counter[char][0] += 1
        counter[char][1] = idx
    end

    uniq = counter.select { |k,v| v[0] < 2 }
    uniqHeap = BinaryMinHeap.new()
    uniq.each do |k,v|
        uniqHeap.push(v[1])
    end
end