#!/usr/bin/env ruby

def match_string(arg)
    regex = /h(b{0,1})tn/
    matched_text = arg.scan(regex).map { |match| "h#{match[0]}tn" }.join("\n")
    puts matched_text
end

# Get the argument from the command line
argument = ARGV[0]

# Call the match_string method
match_string(argument)
