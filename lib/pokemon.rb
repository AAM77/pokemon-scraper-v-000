class Pokemon
  
  attr_accessor :id, :name, :type, :hp, :db
  
  @@all = []
  
  def initialize(id:, name:, type:, hp: nil, db:)
    @id, @name, @type, @hp, @db = id, name, type, hp, db
  end
  
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
    db.execute("SELECT * FROM pokemon WHERE id=?", id).flatten
    Pokemon.new(id: pokemon_info[0], name: pokemon_info[1], type: pokemon_info[2], hp: pokemon_info[3], db: db)
  end #find
end
