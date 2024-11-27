require "pg"

class DB_client
  private_class_method :new

  def instance(db_config = nil)
    @instance ||= new(db_config)

  # constructor
  def initialize(db_config)
    raise "Database config is missing" unless db_config
    self.client = PG.connect(db_config)
  end

  # execute query
  def query(query, params=[])
    self.client.exec_params(query, params)
  end

  # close connection
  def close
    self.client.close
  end

  private
  attr_accessor :client
  @instance = nil
end