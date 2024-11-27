require "pg"

class DB_client
  # constructor
  def initialize(db_config)
    self.client = PG.connect(db_config)
  end

  def query(query, params=[])
    self.client.exec_params(query, params)
  end

  def close
    self.client.close
  end

  private
  attr_accessor :client
end