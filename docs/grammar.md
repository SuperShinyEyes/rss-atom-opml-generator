## Whitespaces
Whitespace characters such as spaces and tabs are generally ignored in Ruby code, except when they appear in strings. Sometimes, however, they are used to interpret ambiguous statements. Interpretations of this sort produce warnings when the -w option is enabled.

```ruby
#!/usr/bin/ruby -w
a + b is interpreted as a+b ( Here a is a local variable)
a  +b is interpreted as a(+b) ( Here a is a method call)
```

## Here Document
```ruby
print <<EOF
    This is the first way of creating
    here document ie. multiple line string.
EOF

print <<"EOF";                # same as above
    This is the second way of creating
    here document ie. multiple line string.
EOF

print <<`EOC`                 # execute commands
	echo hi there
	echo lo there
EOC

print <<"foo", <<"bar"  # you can stack them
	I said foo.
foo
	I said bar.
bar

=begin
    This is the first way of creating
    her document ie. multiple line string.
    This is the second way of creating
    her document ie. multiple line string.
hi there
lo there
        I said foo.
        I said bar.
=end
```

## *Begin* & *End* statement
```ruby
puts "This is main Ruby Program"

BEGIN {
   puts "Initializing Ruby Program"
}

END {
   code
}
```

## Class

Var types | Explanation
------------ | -------------
Class var | @@
Instance var | @
Local var | lowercase or _
Constants | UPPERCASE

* Overriding class variables produce warnings with the -w option.
* Constants may not be defined within methods. Referencing an uninitialized constant produces an error. Making an assignment to a constant that is already initialized produces a warning.

```ruby
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
end

cust1=Customer.new("1", "John", "Wisdom Apartments, Ludhiya")
cust2=Customer.new("2", "Poul", "New Empire road, Khandala")
```

## Pseudo-variables
name | Purpose
------ | ------
self | The receiver object of the current method.
__FILE__ | Current source file
__LINE__ | Current line number


## Loops in arrays
```ruby
ary = [  "fred", 10, 3.14, "This is a string", "last element", ]
ary.each do |i|
   puts i
end
```

## Loops in hashes
```ruby
hsh = colors = { "red" => 0xf00, "green" => 0x0f0, "blue" => 0x00f }
hsh.each do |key, value|
   print key, " is ", value, "\n"
end
```

## Ranges
```ruby
(10..15).each do |n|
   print n, ' '
end
```

```ruby

```

```ruby

```

```ruby

```

```ruby

```

```ruby

```

```ruby

```
