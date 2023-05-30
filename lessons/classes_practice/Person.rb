class Person        #classes are capitalized
    attr_reader :name, :nickname, :catchphrase, :age           #specifices the name we want in the outside world
    attr_writer :name, :nickname, :catchphrase, :age 
    def initialize(name, nickname, catchphrase, age)
        @name = name                # @ - refers to class, like in js 'this.state.name'
        @nickname = nickname
        @catchphrase = catchphrase
        @age = age
    end
end


class Developer < Person 
    attr_accessor :info
    def initialize(name, nickname, catchphrase, age, info)
        @info = info
        super(name, nickname, catchphrase, age)
    end
    
    def print_info
        format_info
    end

    private

    def format_info
        "My name is #{@name}, my nickname is #{@nickname}, my catchphrase is #{@catchphrase}, my age is #{age}"
    end   
end
mike = Person.new("Mike", "Mikooks", "All talk", 24)     #Person is the class; mike is the instantiation(aka product) of the class
mike.catchphrase = "whatever"          #changes the catchphrase

pp mike     # pp - shows the @___ and the definition


mike = Developer.new("Mike", "Mikooks", "All talk", 24, "js expert")   
pp mike.info       

pp mike 