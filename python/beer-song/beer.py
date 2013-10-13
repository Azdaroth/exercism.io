class Beer(object):
  
    _ZERO_BOTTLES = (
        "No more bottles of beer on the wall, no more bottles of beer.\n"
        "Go to the store and buy some more, 99 bottles of beer on the wall.\n" 
        )
    _ONE_BOTTLE = (
        "1 bottle of beer on the wall, 1 bottle of beer.\n"
        "Take it down and pass it around, no more bottles of beer on the wall.\n"
        )
    _TWO_BOTTLES = (
        "2 bottles of beer on the wall, 2 bottles of beer.\n"
        "Take one down and pass it around, 1 bottle of beer on the wall.\n"
        )
    _MULTIPLE_BOTTLES = (
        "%(current_amount)s bottles of beer on the wall, %(current_amount)s bottles of beer.\n"
         "Take one down and pass it around, %(left_amount)s bottles of beer on the wall.\n" 
        )

    _RESPONSES = {
        0: _ZERO_BOTTLES,
        1: _ONE_BOTTLE,
        2: _TWO_BOTTLES
    }

    def verse(self, num):
        return self._RESPONSES.get(num,
               self._MULTIPLE_BOTTLES % dict(current_amount=num, left_amount=num - 1))

    def sing(self, start, end=0):
        verses_numbers = range(start, end-1, -1)
        verses = [self.verse(verse_number) for verse_number in verses_numbers]
        return "\n".join(verses) + "\n"
