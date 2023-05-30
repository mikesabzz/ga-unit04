class Pokemon

    def initialize(size, weight_class, habitat)
        @size = size
        @weight_class = weight_class
        @habitat = habitat
    end

    def speak (sound = "rawr")
        puts sound
    end
end

class SpecificPokemon < Pokemon
    # attr_accessor :info
    def initialize(size, weight_class, habitat, name, type, primary_attack)
        @name = name
        @type = type
        @primary_attack = primary_attack
        super(size, weight_class, habitat)
    end
end


pikachu = SpecificPokemon.new("small", "middle", "land", "Pikachu", "yellow", "attack")

pp pikachu
pikachu.speak()
pikachu.speak("Pika")