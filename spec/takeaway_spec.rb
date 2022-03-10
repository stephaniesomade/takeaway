require 'takeaway'

RSpec.describe Takeaway do
  it "shows the available dishes and its prices" do
    takeaway = Takeaway.new 
    result = takeaway.view_menu
    expect(result).to eq "Pepperoni: £10, Margarita: £9, Hawaiian: £11"
  end

  it "selects some number of things off the menu" do
    takeaway = Takeaway.new
    order = Order.new
    result = takeaway.select_item(order, "Pepperoni")
    expect(result).to eq [{"name" => "Pepperoni", "price" => 10}]
  end

  it "shows the reciept with the total" do 
    takeaway = Takeaway.new
    order = Order.new
    takeaway.select_item(order, "Pepperoni")
    takeaway.select_item(order, "Margarita")
    result = order.show_reciept
    expect(result).to eq "Pepperoni: £10, Margarita: £9, Total: £19"
  end 

  it 'reduces bill by 50% for a random 5% of customers' do
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
        expect(result).to eq "Pepperoni: £10, Margarita: £9, Hawaiian: £11, Discount: -£15, Total: £15"
      else
        expect(result).to eq "Pepperoni: £10, Margarita: £9, Hawaiian: £11, Total: £30"
      end
    end
  end
end