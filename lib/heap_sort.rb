require_relative "heap"

class Array
  def heap_sort!
    # debugger
    len = 1
    prc = Proc.new { |el1, el2| el2 <=> el1 }
    until len == self.length
      BinaryMinHeap.heapify_up(self, len, len, &prc)
      len += 1
    end

    len = self.length - 1
    until len == 0
      self[0], self[len] = self[len], self[0]
      len -= 1
      BinaryMinHeap.heapify_down(self, 0, len+1, &prc)
    end
  end
end
