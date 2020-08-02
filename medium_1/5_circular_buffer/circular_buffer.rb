=begin
https://launchschool.com/exercises/9d5be5ed
=end

class CircularBuffer
  def initialize(size)
    @array = Array.new(size, '')
    @oldest_pos = nil
    @next_pos = nil
  end

  def read
    raise BufferEmptyException if empty?

    read_element = @array[@oldest_pos]
    @array[@oldest_pos] = ''
    @oldest_pos = at_end_of_array?(@oldest_pos) ? 0 : @oldest_pos + 1
    read_element
  end

  def write(element)
    return if !element
    raise BufferFullException if full? 
    if empty?
      pos = (0...@array.size).to_a.sample
      @oldest_pos = pos
      @array[pos] = element
      @next_pos = at_end_of_array?(@oldest_pos) ? 0 : pos + 1
    else
      @array[@next_pos] = element
      @next_pos = at_end_of_array?(@next_pos) ? 0 : @next_pos + 1
    end
  end

  def write!(element)
    return if !element
    if full?
      @array[@oldest_pos] = element
      @oldest_pos = at_end_of_array?(@oldest_pos) ? 0 : @oldest_pos + 1
    else
      write(element)
    end
  end
  
  def clear
    @array.map! { '' }
  end

  def show_attributes
    puts "=== CURRENTLY ==="
    puts "@array: #{@array}"
    puts "@oldest_pos: #{@oldest_pos}"
    puts "@next_pos: #{@next_pos}"
    puts ""
  end

  private

  def full?
    @array.all? { |element| element != '' }
  end

  def empty?
    @array.all? { |element| element == '' }
  end

  def at_end_of_array?(idx)
    idx == @array.size - 1
  end

  class BufferEmptyException < Exception; end
  class BufferFullException < Exception; end 
end

# cb = CircularBuffer.new(3)
# cb.write('1')
# cb.show_attributes
# cb.write('2')
# cb.show_attributes
# cb.write('3')
# cb.write('FULL')
