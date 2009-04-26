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
    :white   => 37
  }
  BACKGROUND_COLORS = {
    :black   => 40,
    :red     => 41,
    :green   => 42,
    :yellow  => 43,
    :blue    => 44,
    :magenta => 45,
    :cyan    => 46,
    :white   => 47
  }

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

    def print(string, options={})
      if options.empty?
         super(string)
      else
         open_tag = Helpers::build_open_tag(options)
         super(open_tag + string.to_s + Helpers::reset)
      end
    end

    def puts(string, options={})
      if options.empty?
         super(string)
      else
         open_tag = Helpers::build_open_tag(options)
         super(open_tag + string.to_s + Helpers::reset)
      end
    end
  end
end

require "ansi_color/string"
