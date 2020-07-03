require_relative '../lib/turnstile'
require 'minitest/autorun'

describe Turnstile do
  subject { Turnstile.new }

  it 'does not allow a person to push through without paying' do
    subject.push_through.must_equal :denied
  end

  it 'allows a person to push through after paying' do
    subject.pay
    subject.push_through.must_equal :permitted
  end

  it 'locks the turnstile after a person has pushed through' do
    subject.pay
    subject.push_through.must_equal :permitted
    subject.push_through.must_equal :denied
  end
end
