#!/usr/bin/env ruby
class HelloWorld
  def initialize(message)
    @message = message
  end 
  def print_hello
    @message
  end
end
hello_world_instance = HelloWorld.new("Hello, World!")
hello_world_instance.print_hello
