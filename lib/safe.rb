# A safe has two states: locked and unlocked;
# The safe has a keypad with the letters A to F on it;
# A code consisting of entering the sequence of keypresses D, E, E and D must be entered in the correct order in order for the safe to be unlocked;
# There is no indication that a correct key has been pressed;
# There is recognisable feedback when the safe is unlocked;
# Any incorrect keypress will reset the sequence and force the opener to start again;
# There is no indication that the opener has entered an incorrect key press;
# Shutting the door of the safe after it has been opened will automatically lock it.

# require 'state_machines'

class Safe
  attr_accessor :state, :entered_code

  PASSCODES = %w(DEED DEAF)

  def initialize
    @state = :locked
    @entered_code = ''
  end

  def open
    state
  end

  def close
    lock_safe
  end

  def key_in(value)
    return :reset if value.size > 1
    entered_code << value
    validate_code
  end

  private

  def validate_code
    unlock_safe if PASSCODES.include?(entered_code)
  end

  def unlock_safe
    self.state = :unlocked
  end

  def lock_safe
    self.state = :locked
  end
end
