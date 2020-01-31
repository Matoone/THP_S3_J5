require "controller"

class Router
  attr_accessor

  def initialize
    @controller = Controller.new
  end

  def perform
    puts "Welcome in the GOSSIP Project"
    puts ""

    while true
      puts "What do you want to do?"
      puts "1/\t Create a new Gossip"
      puts "2/\t Display all Gossips"
      puts "3/\t Delete a Gossip"
      puts "4/\t Exit"
      puts ""
      user_input = gets.chomp.to_i
      case user_input
      when 1
        puts "You have chosen to create a Gossip."
        puts ""
        @controller.create_gossip
        #create Gossip
      when 2
        puts "You have chosen to display all Gossips."
        puts ""
        @controller.index_gossips
      when 3
        puts "You have chosen to delete a Gossip."
        puts ""
        @controller.index_gossips
        puts "Enter the id of the Gossip that you want to delete: "
        print "> "
        choice = gets.chomp.to_i
        puts ""
        @controller.delete_gossip(choice)
      when 4
        puts "You have chosen to quit. Bye bye!"
        break
        #exit app
      else
        puts "This choice doesn't exists. Please try again!"
      end
    end
  end
end
