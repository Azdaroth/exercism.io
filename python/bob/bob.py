class Bob(object):
  
    def hey(self, text):
        message = Message(text)
        return self.dispatch(message)

    def dispatch(self, message):
        for condition, action in self._responses(message).iteritems():
            if condition(): 
                return action()
        else:
            return self._neutral_response()
        
    def _neutral_response(self):
        return 'Whatever.'

    def _annoyed_reponse(self):
        return 'Fine. Be that way!'

    def _approval_response(self):
        return 'Sure.'

    def _anxious_response(self):
        return 'Woah, chill out!'

    def _responses(self, message):
        return { 
          message.is_silent: self._annoyed_reponse,
          message.is_yell: self._anxious_response,
          message.is_question: self._approval_response 
        }



class Message(object):

    def __init__(self, text):
        if text is None:
            text = ""
        self.text = text.strip()

    def is_silent(self):
        return not self.text

    def is_yell(self):
        return self.text.isupper()

    def is_question(self):
        return self.text.endswith("?")
    
        