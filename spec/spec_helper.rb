require 'spec'

$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'ansi_color'
include AnsiColor

Spec::Runner.configure do |config|
  
end

def catch_stdout
   stdout = $>
   fake = StringIO.new ''
   $> = fake
   yield
   $> = stdout
   fake.string
end
