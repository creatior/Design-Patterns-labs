require 'fox16'
require './application.rb'

include Fox

if __FILE__== $0
  app = FXApp.new("Students", "Students")
  App.new(app)
  app.create
  app.run
end