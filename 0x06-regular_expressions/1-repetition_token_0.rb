#!/usr/bin/env ruby

def match_string(arg)
    regex = /hbt\{2,5\}n/
    matched_text = arg.scan(regex).join
    puts matched_text
end

# Get the argument from the command line
argument = ARGV[0]

# Call the match_string method
match_string(argument)
