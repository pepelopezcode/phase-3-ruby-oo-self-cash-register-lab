require 'pry'

class CashRegister
    attr_accessor :total, :discount, :items, :price_list

    def initialize(discount = nil)
        @total = 0
        @discount = discount
        @items = []
        @price_list = []
    end

    def add_item(item, price, quantity = nil)
        quantity ? @total += (price*quantity) : @total += price
        quantity ? quantity.to_i.times{@items<<item} :  @items<<item
        quantity ? @price_list<<price*quantity : @price_list<<price
        puts @price_list
        
    end
    
    def apply_discount
        if(@discount)
        discount = @total * (@discount * 0.01)
        @total = @total - discount
        "After the discount, the total comes to $#{@total.to_i}."
        else "There is no discount to apply."
        end

    end

    def void_last_transaction
        @total -= @price_list[-1]
    end

    

end
