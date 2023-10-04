#!/usr/bin/env ruby

def extract_sms_info(text)
    # Remove HTML entities like &nbsp; and replace them with spaces
    cleaned_text = text.gsub(/&nbsp;/, ' ')
    
    # Define the regular expression pattern to match the required information
    pattern = /\[from:(\d+)\] \[to:(\d+)\] \[flags:(.*?)\]/
    
    # Use the pattern to extract sender, receiver, and flags
    match_data = cleaned_text.match(pattern)
    
    if match_data
        sender = match_data[1]
        receiver = match_data[2]
        flags = match_data[3]
        puts "#{sender},#{receiver},#{flags}"
    else
        puts "No match found in the input."
    end
end

# Get the argument from the command line
argument = ARGV[0]

# Call the match_string method
extract_sms_info(argument)
