class Array

  def keep    
    collection = []
    each do |el|
      collection << el if yield el
    end
    collection
  end

  def discard
    collection = []
    each do |el|
      collection << el unless yield el
    end
    collection
  end

end