class Pokemon
  
  attr_accessor :id, :name, :type, :hp, :db
  
  @@all = []
  
  def initialize(attributes)
    attributes.each {|key, value| self.send(("#{key}="), value)}
    @@all << self
  end #initialize
  
  def self.all
    @@all
  end #all
  
  def id
    @id
  end #id
  
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end #save
  
  def self.find(id, db)
    db.execute("SELECT * FROM pokemon WHERE id=?", id)
  end #find
end
