class Dog

    def initialize(name, breed, age, bark, favorite_foods)
        @name = name
        @breed = breed
        @age = age
        @bark = bark
        @favorite_foods = favorite_foods
    end

    def name
        @name
    end

    def breed
        @breed
    end

    def age
        @age
    end

    def age=(new_num)
        @age = new_num
    end

    def bark
        if self.age >3
            @bark.upcase
        else
            @bark.downcase
        end
    end
    
    def favorite_foods
        @favorite_foods
    end

    def favorite_food?(food)
        @favorite_foods.each do |ele|
            if food.downcase == ele.downcase
                return true
            end
        end
        return false
    end

end
