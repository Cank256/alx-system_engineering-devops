#!/usr/bin/env ruby

# Check if the argument contains the word "School"
def match_school(arg)
    regex = /School/
    matched_text = arg.scan(regex).join
    puts matched_text
end

# Check if there is an argument provided
if ARGV.empty?
    puts "Usage: ./school_match.rb <argument>"
    exit 1
end

# Get the argument from the command line
argument = ARGV[0]

# Call the match_school method
match_school(argument)
