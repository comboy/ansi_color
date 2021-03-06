require File.dirname(__FILE__) + '/spec_helper'

describe AnsiColor do
  describe "print" do
    it "print the original string with no options" do
      string = catch_stdout { AnsiColor.print('james') } 
      string.should == 'james'
    end

    it "print non string objects with no options" do
      string = catch_stdout { AnsiColor.print(234) } 
      string.should == '234'
    end

    it "red and bold on non string object" do
      string = catch_stdout { AnsiColor.print(42, :color => :red, :effects => :bold) }
      string.should == "#{E}31;1m42#{E}0m"
    end

    it "print many args with no options" do
      str = catch_stdout { AnsiColor.print(1,'w0t',2) }
      str.should == "1w0t2"
    end

    it "print many args in red and bold" do
      str = catch_stdout { AnsiColor.print(1,'w0t',2, :color => :red, :effects => :bold) }
      str.should == "#{E}31;1m1w0t2#{E}0m"
    end

    it "red and bold" do
      string = catch_stdout { AnsiColor.print('james', :color => :red, :effects => :bold) }
      string.should == "#{E}31;1mjames#{E}0m"
    end

    it "blue on white blinking" do
      tag = catch_stdout { 
         AnsiColor.print('james', :color => :blue,
            :background => :white,
            :effects => :blink) 
         }
      tag.should == "#{E}34;47;5mjames#{E}0m"
    end

    it "if symbol is a last parameter treat it as color" do
    	s1 = catch_stdout { AnsiColor.print('comboy', :color => :red) }
    	s2 = catch_stdout { AnsiColor.print('comboy', :red) }
	s1.should == s2
    end
  end

  describe "puts" do
    it "print the original string with no options" do
      string = catch_stdout { AnsiColor.puts('james') }
      string.should == "james\n"
    end

    it "print some number with no options" do
      string = catch_stdout { AnsiColor.puts(243) }
      string.should == "243\n"
    end

    it "red and bold" do
      string = catch_stdout { AnsiColor.puts('james', :color => :red, :effects => :bold) }
      string.should == "#{E}31;1mjames#{E}0m\n"
    end

    it "blue on white blinking" do
      string = catch_stdout { 
         AnsiColor.puts('james', :color => :blue,
            :background => :white,
            :effects => :blink)
         }
      string.should == "#{E}34;47;5mjames#{E}0m\n"
    end

    it "if symbol is a last parameter treat it as color" do
    	s1 = catch_stdout { AnsiColor.puts('comboy', :color => :red) }
    	s2 = catch_stdout { AnsiColor.puts('comboy', :red) }
	s1.should == s2
    end

  end
  
  describe "color codes from names" do
    FOREGROUND_COLORS.each do |name, code|
      it "#{name} returns #{code}" do
        AnsiColor.send(name).should == code
      end
    end

    BACKGROUND_COLORS.each do |name, code|
      it "#{name}_background returns #{code}" do
        AnsiColor.send("#{name}_background").should == code
      end
    end

    EFFECTS.each do |name, code|
      it "#{name} returns #{code}" do
        AnsiColor.send("#{name}").should == code
      end
    end
  end
end
