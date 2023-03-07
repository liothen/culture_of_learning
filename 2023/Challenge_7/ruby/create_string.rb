#!/usr/bin/env ruby
# frozen_string_literal: true
string_to_encode = 'Hello World!                                  '

# Create some padding
left_padding = Array.new(rand(512..2048)) { rand(1..64) }
                    .reject { [32, 33].include?(_1) }
                    .map { _1 << 3 }
                    .pack('Q*')

# Create some more padding
right_padding = Array.new(rand(512..2048)) { rand(1..64) }
                     .reject { [32, 33].include?(_1) }
                     .map { _1 << 3 }
                     .pack('Q*')

# Array pack string
string_byte_array = string_to_encode
                    .chars
                    .map(&:ord)
                    .map.with_index { _1 << (_2 + 3) }
                    .pack('Q*')

# Write ruby script
open('main.rb', 'w') do |f|
  f << File.read('main_template.rb')
  f << left_padding + string_byte_array + right_padding
end
