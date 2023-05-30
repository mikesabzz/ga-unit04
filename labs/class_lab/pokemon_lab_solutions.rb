class Pokemon
    attr_accessor :size, :weight_class, :habitat
    def initialize(size, weight_class, habitat)
        @size = size
        @weight_class = weight_class
        @habitat = habitat
    end
    def speak(sound = "rawr")
        puts sound
    end
end
class SpecificPokemon < Pokemon
    attr_accessor :name, :type, :primary_attack
    def initialize(size, weight_class, habitat, name, type, primary_attack)
        super(size, weight_class, habitat)
        @name = name
        @type = type
        @primary_attack = primary_attack
    end
    def attack
        puts "#{@name} used #{@primary_attack}"
    end
    def new_attack(move)
        @primary_attack = move
    end
end
pikachu = SpecificPokemon.new("small", "light", "land", "Pikachu", "electric", "thunder bolt")
pp pikachu
pikachu.speak()
pikachu.speak("Pika")
pikachu.attack
pikachu.new_attack("volt tackle")
pikachu.attack