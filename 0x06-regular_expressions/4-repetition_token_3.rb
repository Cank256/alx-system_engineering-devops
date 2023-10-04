#!/usr/bin/env ruby

def match_string(arg)
    regex = /hb(t{0,5})n(?!.*o)/
    matched_text = arg.scan(regex).map { |match| "hb#{match[0]}n" }.join("\n")
    puts matched_text
end

# Get the argument from the command line
argument = ARGV[0]

# Call the match_string method
match_string(argument)
