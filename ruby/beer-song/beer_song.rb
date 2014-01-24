class BeerSong
  
  def verse(upper_limit)  
    if upper_limit == 2
      two_bottles
    elsif upper_limit == 1
      one_bottle
    elsif upper_limit == 0
      no_more_bottles
    else
      multiple_bottles(upper_limit)
    end  
  end

  def verses(upper_limit, bottom_limit)
    (upper_limit).downto(bottom_limit).map do |current_verse|
      verse(current_verse)
    end.join("\n") + "\n"
  end

  def sing
    verses(99, 0)
  end

  private

    def multiple_bottles(amount)
      new_amount = amount - 1
      [
        "#{amount} bottles of beer on the wall, #{amount} bottles of beer.",
        "Take one down and pass it around, #{new_amount} bottles of beer on the wall."
      ].join("\n") + "\n"
    end

    def two_bottles
      "2 bottles of beer on the wall, 2 bottles of beer.\nTake one down and pass it around, 1 bottle of beer on the wall.\n"
    end

    def one_bottle
      "1 bottle of beer on the wall, 1 bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n"
    end

    def no_more_bottles
      "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n"
    end

    



end