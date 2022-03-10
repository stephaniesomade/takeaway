class Takeaway
  def initialize
    @menu = {"Pepperoni" => 10, "Margarita" => 9, "Hawaiian" => 11}
  end 

  def menu
    @menu
  end

  def view_menu
    arr = [] 
    @menu.each { |key, val|
      arr << "#{key.to_s}: £#{val.to_s}" }
      arr.join(", ")
  end

  def select_item(order, item)
    order.add(item, @menu[item])
  end
end

class Order
  def initialize
    @current_order = []
    @random_number = rand(1..20)
  end
  
  def add(name, price)
    @current_order << {"name" => name, "price" => price}
  end

  def random_number
    @random_number
  end

  def show_reciept
    reciept = []
    total_price = 0
    @current_order.each { |i|
      reciept << "#{i["name"]}: £#{i["price"]}"
      total_price += i["price"]
    }

    if @random_number == 1
      discount = total_price / 2
      reciept << "Discount: -£#{discount}"
      total_price /= 2
    end
    
    reciept << "Total: £#{total_price}"
    return reciept.join(", ")
  end
end 