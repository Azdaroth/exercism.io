class Array
  
  def accumulate
    transformed = []
    each do |el|
      transformed << (yield el)
    end
    transformed 
  end

end