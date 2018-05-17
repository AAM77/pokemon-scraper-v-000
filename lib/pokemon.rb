class Pokemon
  
  attr_accessor :id, :name, :type, :hp, :db

  def initialize(id:, name:, type:, hp: nil, db:)
    attributes.each {|key, value| self.send(("#{key}="), value)}
  end #initialize
  
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end #save
  
  def self.find(id, db)
    pokemon_details = db.execute("SELECT * FROM pokemon WHERE id=?", id).flatten
    Pokemon.new(id: pokemon_details[0], name: pokemon_details[1], type: pokemon_details[2], hp: pokemon_details[3], db: db)
  end #find
  
  def alter_hp
    
  end #alter_hp
end
