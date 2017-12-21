require 'benchmark'
require_relative 'password_generator'

result = ""
Benchmark.bm 10 do |r|
  r.report "GeneratingSpeed" do
    pw = PasswordGenerator.new(length: 8, exclude_chars: %w(0 O o), use_symbols: %w(* $ # @))
    result = pw.generate
  end
end
puts result
