class Proverb
  
  def initialize(*causes)
    if causes.last.kind_of? Hash
      @qualifier = causes.pop.fetch(:qualifier)
    end
    @causes = causes
  end

  def to_s
    all_verses + ending
  end

  private
    
    def all_verses
      @causes.each_cons(2).map do |cause, consequence| 
        verse(cause, consequence) 
      end.join
    end

    def verse(cause, consequence)
      "For want of a #{cause} the #{consequence} was lost.\n"
    end

    def ending
      "And all for the want of a #{original_cause}."
    end

    def original_cause
      qualifier + first_cause
    end

    def qualifier
      @qualifier ? "#{@qualifier} "  : ""
    end

    def first_cause
      @causes.first
    end

end