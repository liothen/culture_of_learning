#!/usr/bin/env ruby
# frozen_string_literal: true
puts DATA.read.unpack('Q*').map{_1>>3}.reject{_1<=64}.map.with_index{_1>>_2}.map(&:chr).join
__END__
