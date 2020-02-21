class Meal

    attr_accessor :waiter, :customer, :total, :tip
    @@all = []

    def initialize(waiter, customer, total, tip=0)
        @waiter = waiter
        @customer = customer
        @total = total
        @tip = tip
        @@all << self
    end 

    def self.all
        @@all
    end 

    sam = Customer.new("Sam", 27)
    pat = Waiter.new("Pat", 2)
    alex = Waiter.new("Alex", 5)

    sam.new_meal(pat, 50, 10)
    sam.new_meal(alex, 20, 3)
    pat.new_meal(sam, 30, 5)
    

end