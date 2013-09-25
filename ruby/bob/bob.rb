class Bob

  def hey(message)
    answer(MessageType.new(message))
  end

  private

    def answer(message_type)
      case 
      when message_type.silent?
        annoyed
      when message_type.yell?
        anxious
      when message_type.question? 
        approve
      else
        neutral
      end
    end

    def approve
      "Sure."
    end

    def annoyed
      "Fine. Be that way."
    end

    def anxious
      "Woah, chill out!"
    end

    def neutral
      "Whatever." 
    end

end

class MessageType
  
  attr_reader :message
  def initialize(message)
    @message = message.to_s
  end  

  def silent?
    message.strip.empty?
  end

  def question?
    message.end_with?("?")
  end

  def yell?
    message.upcase == message
  end

end
