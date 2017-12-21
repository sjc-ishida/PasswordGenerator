class PasswordGenerator
  attr_reader :length, :exclude_chars, :use_symbols

  def initialize(length: 10, exclude_chars: [], use_symbols: [])
    @length = length
    @exclude_chars = exclude_chars
    @use_symbols = use_symbols
  end

  def generate
    chars = (lower_chars + upper_chars + numbers + use_symbols).shuffle
    chars[0] = lower_chars.sample
    chars[1] = upper_chars.sample
    chars[2] = numbers.sample
    chars.shift(length).shuffle.join("")
  end

  private

  def lower_chars
    @lower_chars ||= ("a".."z").to_a - exclude_chars
  end

  def upper_chars
    @upper_chars ||= ("A".."Z").to_a - exclude_chars
  end

  def numbers
    @numbers ||= ("0".."9").to_a - exclude_chars
  end
end

