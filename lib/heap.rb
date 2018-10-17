require 'byebug'
class BinaryMinHeap
  attr_reader :store, :prc

  def initialize(&prc)
    @store = []
    prc ||= Proc.new { |el1, el2| el1 <=> el2 }
  end

  def count
    @store.length
  end

  def extract
    @store[0], @store[self.count - 1] = @store[self.count - 1], @store[0]
    extracted = @store.pop
    BinaryMinHeap.heapify_down(@store, 0)
    extracted
  end

  def peek
    @store[0]
  end

  def push(val)
    @store.push(val)
    BinaryMinHeap.heapify_up(@store, @store.length-1)
  end

  public
  def self.child_indices(len, parent_index)
    children = []
    2.times do |i|
      idx = parent_index * 2 + i + 1
      children.push(idx) if idx < len
    end
    children
  end

  def self.parent_index(child_index)
    raise "root has no parent" if child_index == 0
    (child_index - 1)/2
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
    prc ||= Proc.new { |el1, el2| el1 <=> el2 }
    children = BinaryMinHeap.child_indices(len, parent_idx)
    left_idx, right_idx = children
    return array if children.all? { |child| prc.call(array[parent_idx], array[child]) <= 0 && child < len}

    if children.length == 2
      swap_idx = prc.call(array[left_idx],array[right_idx]) <= 0 ? children[0] : children[1]
    else
      swap_idx = children[0]
    end
    array[parent_idx], array[swap_idx] = array[swap_idx], array[parent_idx]
    BinaryMinHeap.heapify_down(array, swap_idx, len, &prc)
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
    # debugger
    prc ||= Proc.new { |el1, el2| el1 <=> el2 }
    return array if child_idx == 0
    parent_idx = BinaryMinHeap.parent_index(child_idx)
    return array if prc.call(array[parent_idx],array[child_idx]) <= 0
    array[parent_idx], array[child_idx] = array[child_idx], array[parent_idx]
    BinaryMinHeap.heapify_up(array,parent_idx,len,&prc)
  end
end
