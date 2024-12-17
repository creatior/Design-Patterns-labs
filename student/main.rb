require 'dotenv/load'
require './application.rb'
require './data_access/db_client/db_client.rb'
require 'fox16'

include Fox

if __FILE__== $0
  DB_client.instance(
    host: ENV['DB_HOST'],
    dbname: ENV['DB_NAME'],
    user: ENV['DB_USER'],
    password: ENV['DB_PASSWORD']
  )

  app = FXApp.new("Students", "Students")
  App.new(app)
  app.create
  app.run
end