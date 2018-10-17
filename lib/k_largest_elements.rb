require_relative 'heap'

def k_largest_elements(array, k)
    len = 1
    array_length = array.length
    until len == array_length
        prc = Proc.new { |el1, el2| el2 <=> el1 }
        BinaryMinHeap.heapify_up(array, len, len, &prc)
        len += 1
    end

    len = array_length - 1
    until len - 1 == k
        array[0], array[len] = array[len], array[0]
        len -= 1
        BinaryMinHeap.heapify_down(array, 0, len, &prc)
    end
    array[array.length - k,array.length]
end
