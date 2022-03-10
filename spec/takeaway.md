As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices.

As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes.

As a customer
So that I can verify that my order is correct
I would like to see an itemised receipt with a grand total.

```ruby
# 1
class: Takeaway

initialize 

* The method will accept no parameters.

* the method will have an instance variable named menu that will hold a hash. This has the menu for the customers to choose from.

methods

* menu - method exposes the @menu variable so the customer can view the menu in the next method. 

* view_menu - method returns the menu in the correct format which is displayed by the customer. 

* select_item - method accepts two variables, one being order(new order initialised) and item the customer wishes to choose. This will add the item to a hash. 

class: Order

initialize

* the method accepts no parameters.

* the method will hold two instance variables. Will hold the current order as an array and generate a random number for the each order. 

methods

* add - method adds the order as a hash.

* random_number - exposes the instance variable

* show_reciept - method prints out the reciept dependant on the random number generated
```

```ruby
# example test cases

# 1 - tests the menu
  takeaway = Takeaway.new 
  takeaway.view_menu
  # => "Pepperoni: £10, Margarita: £9, Hawaiian: £11"

# 2 - returns selected items
  takeaway = Takeaway.new
  order = Order.new
  takeaway.select_item(order, "Pepperoni")
  # => [{"name" => "Pepperoni", "price" => 10}]

# 3 - shows reciepts
  takeaway = Takeaway.new
  order = Order.new
  akeaway.select_item(order, "Pepperoni")
  takeaway.select_item(order, "Margarita")
  order.show_reciept
  # => "Pepperoni: £10, Margarita: £9, Total: £19" 

# 4 - reduces bill if selected (5% of customers)
  takeaway = Takeaway.new
    orders = Array.new(100) { |i| Order.new }
    orders.each do |order|
      takeaway.select_item(order, "Pepperoni")
      takeaway.select_item(order, "Margarita")
      takeaway.select_item(order, "Hawaiian")
    end
    orders.each do |order|
      result = order.show_reciept
      if order.random_number == 1
        # => "Pepperoni: £10, Margarita: £9, Hawaiian: £11, Discount: -£15, Total: £15"
      else
        # => "Pepperoni: £10, Margarita: £9, Hawaiian: £11, Total: £30"
      end
    end
  end
```