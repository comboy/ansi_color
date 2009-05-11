$:.push File.dirname(__FILE__)
require "ansi_color/helpers"
require "ansi_color/effects"
require "ansi_color/rainbow"

module AnsiColor
  class InvalidColorName < StandardError; end
  class InvalidColorCode < StandardError; end
  class InvalidEffect < StandardError; end

  E = "\033["
  RESET = "#{E}0m"
  EFFECTS = {
    :normal     => 0,
    :bold       => 1,
    :italics    => 3,
    :underscore => 4,
    :blink      => 5,
    :inverse    => 7
  }
  FOREGROUND_COLORS = {
    :black   => 30,
    :red     => 31,
    :green   => 32,
    :yellow  => 33,
    :blue    => 34,
    :magenta => 35,
    :cyan    => 36,
    :white   => 37,
    :default => 39

  }
  BACKGROUND_COLORS = {
    :black   => 40,
    :red     => 41,
    :green   => 42,
    :yellow  => 43,
    :blue    => 44,
    :magenta => 45,
    :cyan    => 46,
    :white   => 47,
    :white   => 49
  }

  module StdOut

    def print(*args)
      if [Hash,Symbol].include? args.last.class
         options = args.pop
	 options = {:color => options} if options.kind_of? Symbol 
         open_tag = Helpers::build_open_tag(options)
         super(open_tag + args.map{|a| a.to_s}.join + Helpers::reset)
      else
         super(*args)
      end
    end

    def puts(*args)
      if [Hash,Symbol].include? args.last.class
         options = args.pop
	 options = {:color => options} if options.kind_of? Symbol 
         open_tag = Helpers::build_open_tag(options)
         super(open_tag + args.map{|a| a.to_s}.join("\n") + Helpers::reset)
      else
         super(*args)
      end
    end

  end

  class << self
    FOREGROUND_COLORS.each do |name, code|
      define_method(name) { code }
    end

    BACKGROUND_COLORS.each do |name, code|
      define_method("#{name}_background") { code }
    end

    EFFECTS.each do |name, code|
      define_method(name) { code }
    end

    include StdOut 

  end
end

require "ansi_color/string"
