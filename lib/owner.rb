class Owner
 
  @@all=[]
  
  attr_reader :name,:species 

  def initialize(name,species ="human")
    @name=name
    @species = species
    @@all << self 
  end 
  
   
  def say_species 
   return "I am a #{@species}."
  end 
  
  def self.all
    @@all
 end 
  
  def self.count
     @@all.length
  end 
  
  def self.reset_all
  @@all.clear 
  end
  
  def cats
   Cat.all.select{|cat| cat.owner==self}
  end 
  
  def dogs
   Dog.all.select{|dog| dog.owner==self}
  end 
  
  def buy_cat(name) 
     @@all << cat = Cat.new(name,self)
  end 

  def buy_dog(name)
     @@all << dog = Dog.new(name,self)
  end 

   def walk_dogs
    Dog.all.each do |dog|
      dog.mood = 'happy'
    end
   end 

  def feed_cats
  Cat.all.each do |cat|
      cat.mood = 'happy'
    end
end 
 
  def sell_pets
   
     Cat.all.drop_while{|cat|
     (cat.owner=nil)||(cat.mood="nervous") }
  
  
     Dog.all.drop_while{|dog|
     (dog.owner=nil)||(dog.mood="nervous")}
  
	end 
  
 def list_pets
     "I have #{dogs.length} dog(s), and #{cats.length} cat(s)."
 end
 end 