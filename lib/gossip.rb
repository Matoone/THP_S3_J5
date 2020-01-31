class Gossip
  attr_reader :author, :content, :id
  @@gossip_count = 0

  def initialize(author, content, id)
    @author = author
    @content = content
    @id = id
    @@gossip_count = find_highest_id
  end

  def find_highest_id
    json = File.read("lib/db/gossip.json")
    array = JSON.parse(json)
    temp = -1
    array.each { |gossip|
      if gossip["id"] >= temp
        temp = gossip["id"]
      end
    }
    if temp > -1
      return temp
    else
      return 0
    end
  end

  def save
    @@gossip_count += 1
    tempHash = { "author" => @author, "content" => @content, "id" => @@gossip_count }
    json = File.read("lib/db/gossip.json")
    array = JSON.parse(json)
    array.push(tempHash)
    File.open("lib/db/gossip.json", "w") do |f|
      f.puts JSON.pretty_generate(array)
    end
  end

  def self.all
    all_gossips = []
    json = File.read("lib/db/gossip.json")
    array = JSON.parse(json)
    array.each { |hash|
      temp_gossip = Gossip.new(hash["author"], hash["content"], hash["id"])
      all_gossips.push(temp_gossip)
    }
    all_gossips
  end

  def self.delete(gossip_id)
    json = File.read("lib/db/gossip.json")
    array = JSON.parse(json)
    array.reject! { |gossip| gossip["id"] == gossip_id }
    File.open("lib/db/gossip.json", "w") do |f|
      f.puts JSON.pretty_generate(array)
    end
  end
end
