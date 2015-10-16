require 'optparse'

module Anagram
  class Options
    # Default dictionary
    DICTIONARY = "/usr/share/dict/words"

    # Attributes
    attr_reader :dictionary, :words_to_find

    def initialize(args)
      @dictionary    = DICTIONARY
      @words_to_find = args
      parse(args)
    end

    private

    def parse(args)
      OptionParser.new do |opts|
        opts.banner = "Usage: anagram [ options ] word1 word2 ..."

        # Option with "-d"
        opts.on("-d", "--dict path", String, "Path to dictionary") do |dict|
          @dictionary = dict
        end

        # Option with "-h"
        opts.on("-h", "--help", String, "Show this message") do
          puts opts
          exit
        end

        # Begin-rescue for args if no option given
        begin
          args = ["-h"] if args.empty?
          opts.parse!(args)
        rescue OptionParser::ParseError => e
          STDERR.puts e.message, "\n", opts
          exit(-1)
        end
      end
    end
  end
end
