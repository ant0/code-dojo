require_relative '../lib/safe'
require 'minitest/autorun'

describe Safe do
  subject { Safe.new }

  it 'does not open' do
    subject.open.must_equal :locked
  end

  it 'does not open when an incorrect code is entered' do
    subject.key_in('F')
    subject.key_in('E')
    subject.key_in('E')
    subject.key_in('D')
    subject.open.must_equal :locked
  end

  it 'resets the sequence and forces the opener to start again upon any incorrect keypress' do
    subject.key_in('F')
    subject.key_in('E')
    subject.key_in('E')
    subject.key_in('F')
    subject.open.must_equal :locked
  end

  it 'opens when the correct passcode is entered' do
    subject.key_in('D')
    subject.key_in('E')
    subject.key_in('E')
    subject.key_in('D')
    subject.open.must_equal :unlocked
  end

  it 'locks the safe when the door is closed' do
    subject.key_in('D')
    subject.key_in('E')
    subject.key_in('E')
    subject.key_in('D')
    subject.open
    subject.close
  end

  it 'accepts a second passcode' do
    subject.key_in('D')
    subject.key_in('E')
    subject.key_in('A')
    subject.key_in('F')
    subject.open.must_equal :unlocked
  end

  def key_in(value)
  end
end
