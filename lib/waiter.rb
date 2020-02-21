class Waiter
    attr_accessor :name, :y_o_e

    @@all = []
    def initialize(name, y_o_e)
        @name = name
        @y_o_e = y_o_e
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer, total, tip=0)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select do |meal|
            meal.waiter == self
        end
    end

    def best_tipper
        best_tip = meals.max do |meal_a, meal_b|
            meal_a.tip <=> meal_b.tip
        end
        best_tip.customer
    end
end