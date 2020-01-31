class View
  def initialize
  end

  def create_gossip
    puts "Who is the author of this new gossip?"
    author = gets.chomp
    puts "What is the content of this new gossip?"
    content = gets.chomp
    return { "author" => author, "content" => content }
  end

  def index_gossips(gossips)
    gossips.each { |gossip| puts "ID: #{gossip.id}\n Author: #{gossip.author}\nContent: #{gossip.content}\n\n" }
  end
end
