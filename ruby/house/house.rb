class House

  def verse(count)
    starter + events(count) + ender
  end

  def verses(first, last)
    (first..last).map do |number|
      verse(number) + "\n"
    end.join
  end

  private

    def starter
      "This is the "
    end

    def parts
      ["house", "malt that lay in", "rat that ate", "cat that killed",
      "dog that worried", "cow with the crumpled horn that tossed",
      "maiden all forlorn that milked", "man all tattered and torn that kissed",
      "priest all shaven and shorn that married",
      "rooster that crowed in the morn that woke",
      "farmer sowing his corn that kept",
      "horse and the hound and the horn that belonged to"]
    end

    def ender
      " that Jack built.\n"
    end

    def events(count)
      parts.take(count).reverse.join(" the ")
    end

end