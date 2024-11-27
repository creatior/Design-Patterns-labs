require 'pg'

conn = PG.connect(
  host: 'localhost',
  dbname: 'students',
  user: 'postgres',
  password: '123'
)


result = conn.exec('SELECT * FROM student')
result.each do |row|
  puts row
end

conn.close if conn
