# The objective of this kata is to create a simple program that models a simple coin-operated turnstile.
# The turnstile has two states: locked and unlocked;
# When locked, inserting a coin unlock it;
# When unlocked, pushing lets the person through and locks the stile again.
# Example of a finite state machine

class Turnstile
  attr_accessor :state

  def initialize
    @state = :denied
  end

  def push_through
    state_upon_entry = state
    lock_turnstile
    state_upon_entry
  end

  def pay
    unlock_turnstile
  end

  private

  def lock_turnstile
    self.state = :denied
  end

  def unlock_turnstile
    self.state = :permitted
  end
end
