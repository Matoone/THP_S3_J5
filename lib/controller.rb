require "gossip"
require "view"

class Controller
  attr_accessor :view

  def initialize
    @view = View.new
  end

  def create_gossip
    params = @view.create_gossip
    gossip = Gossip.new(params["author"], params["content"], params["id"])
    gossip.save
    puts ""
    puts "Gossip created !"
    puts ""
  end

  def index_gossips
    gossips_array = Gossip.all
    @view.index_gossips(gossips_array)
  end

  def delete_gossip(gossip_id)
    Gossip.delete(gossip_id)
    puts "Gossip with id #{gossip_id} was deleted !"
    puts ""
  end
end
