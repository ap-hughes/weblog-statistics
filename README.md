# Weblog::Statistics

A simple terminal application to retrieve statistics from website .log files, returning statistics including:
* An ordered count of all visits to each webpage
* An ordered count of all unique visits to each webpage

These results are printed to the terminal for ease of use and outputted to a CSV file in the application's `stats` directory for wider distribution.

## Installation

This application has been developed on:

`ruby 2.7.2`

The application makes use of bundler and includes rspec, rubocop and rake. Just execute the following to install:

`bundle install`

## Usage

To run the application with the provided webserver.log file, run `rake run`

To run the application with your own log file, please provide the filepath of your logfile as an argument, e.g. `rake run my_directory/my_log_file.log`

To run the tests, run `rake spec`

To run the linter (rubocop), run `rake rubocop`

## Considerations

There's potentially a lot of scope to expand the functionality of the application. I initially begun by accepting user input with questions and `gets.chomp` but on re-reading the specification decided to keep it simpler and output all results on passing a file as an argument (optional). Arguably this interactivity could be a nice feature - e.g. adding a while loop and questions with a numbered list to retrieve different statistics (e.g. 1. all visitors, 2. unique visitors, 3. stop programme).

I began by implementing a CSV output for the statistics, so this element remains. Re-reading the spec I decided on outputting to the terminal as well. This element could be further smartened up and perhaps the option provided for the user to choose how they want the results presented as per above. Similarly, the CSV could be expanded to accept user input on where the file should be saved, etc.

There are different ways of cutting the statistics too, perhaps including the IPs with the data may have been a nice addition, I decided on a cleaner output, as I figured the stats were the more pertinent feature. Additionally, while there is a custom error handler re the file type passed in, I may be assuming too readily that the content of the file will be uniform all the time - without more context though it's difficult to know what additional error handling I might require.

In the interests of time, I've paused development to get this over to you. I concede it's been a while since I have structured and run a 'plain Ruby' programme - it's been a good exercise. So, I'm sure there's are other considerations in terms of the structure and design of the application which I could have considered and I would be really interested to learn from your feedback.
