#!/usr/bin/env ruby

def extract_transaction_info(text)
    # Define the regular expression pattern to match transactions
    pattern = /(\S+)\s+>\s+(\S+)\s+\[(.*?)\]/
    
    # Extract sender, receiver, and flags using the pattern
    matches = text.scan(pattern)

    # Print the extracted information
    matches.each do |match|
        sender = match[0]
        receiver = match[1]
        flags = match[2]
        puts "#{sender},#{receiver},#{flags}"
    end
end

# Get the argument from the command line
argument = ARGV[0]

# Call the match_string method
extract_sms_info(argument)
