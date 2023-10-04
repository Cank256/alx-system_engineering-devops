#!/usr/bin/env ruby

def extract_sms_info(text)
    # Define the regular expression pattern to match the required information
    pattern = /\[from:(\+\d+)\] \[to:(\+\d+)\] \[flags:(.*?)\]/
    
    # Use the pattern to extract sender, receiver, and flags
    match_data = text.match(pattern)
    
    if match_data
        sender = match_data[1]
        receiver = match_data[2]
        flags = match_data[3]
        puts "#{sender},#{receiver},#{flags}"
    else
        puts "No match found in the input."
    end
end

# Input text
input_text = 'Feb 1 11:00:00 ip-10-0-64-10 mdr: 2016-02-01 11:00:00 Receive SMS [SMSC:SYBASE2] [SVC:] [ACT:] [BINF:] [FID:] [from:+17272713208] [to:+19172319348] [flags:-1:0:-1:0:-1] [msg:136:Orbiting this at a distance of roughly ninety-two million miles is an utterly insignificant little blue green planet whose ape-descended] [udh:0:]'

# Extract and print SMS information
extract_sms_info(input_text)
