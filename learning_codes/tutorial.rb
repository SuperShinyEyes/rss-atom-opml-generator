#!/usr/bin/ruby -w
puts "Hello, Ruby!";

class Customer
   @@no_of_customers=0
   VAR1 = 100
   VAR2 = 200

   def initialize(id, name, addr)
      @cust_id=id
      @cust_name=name
      @cust_addr=addr
   end
   def display_details()
      puts "Customer id #@cust_id"
      puts "Customer name #@cust_name"
      puts "Customer address #@cust_addr"
    end
    def total_no_of_customers()
       @@no_of_customers += 1
       puts "Total number of customers: #@@no_of_customers"
    end

    def show_constants
        puts "Value of first Constant is #{VAR1}"
        puts "Value of second Constant is #{VAR2}"
    end

    attr_reader :cust_id
end

cust1=Customer.new("1", "John", "Wisdom Apartments, Ludhiya")
cust2=Customer.new("2", "Poul", "New Empire road, Khandala")
cust1.total_no_of_customers()
cust2.total_no_of_customers()
# cust2.show_constants
puts cust1.cust_id

# ary = [  "fred", 10, 3.14, "This is a string", "last element", ]
# ary.each do |i|
#    puts i
# end
