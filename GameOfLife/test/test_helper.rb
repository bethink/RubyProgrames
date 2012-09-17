require 'test/unit'
Dir.glob('./app/*rb').collect{|i| require i }
Dir.glob('./app/helper/*rb').collect{|i| require i }
require 'pry'

