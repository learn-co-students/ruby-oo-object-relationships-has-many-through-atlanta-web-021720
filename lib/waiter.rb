
class Waiter

    attr_accessor :name, :yrs_experience, :meal

    @@all = []

    def initialize(name, yrs_experience)
        @name = name
        @yrs_experience = yrs_experience
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer, total, tip=0)
        Meal.new(self, customer, total, tip=0)
    end

    def meals
        Meal.all.select { |meal|
            meal.waiter == self
        }
    end

    def best_tipper
        highest_tip = 0
        generous_customer = nil
        meals.each { |meal|
            if meal.tip > highest_tip
                highest_tip = meal.tip
                generous_customer = meal.customer
            end
        }
        generous_customer
    end

    #code below did not work. error "uninitialized constant Waiter::Meals"
    # def frequent_customer
    #     customer_count = {}
    #     meals.each { |meal|
    #         customer_count[(meal.customer.name)] ||= 0
    #         customer_count[(meal.customer.name)] += 1
    #     }
    #     highest_frequency = 0
    #     frequent_customer = nil
    #     customer_count.select { |customer, count|
    #         if count > highest_frequency
    #             highest_frequency = count
    #             frequent_customer = customer
    #         end
    #     }
    #     frequent_customer
    # end

end

