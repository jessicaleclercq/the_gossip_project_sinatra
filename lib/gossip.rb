#require 'pry'
require 'csv'

class Gossip
  attr_accessor :author, :content

  def initialize(author, content)
    @content = content
    @author = author
  end

  def save
    CSV.open("./db/gossip.csv", "ab") do |csv| #ouvrir en ab
    csv << [@author, @content]
    end
  end  

  def self.all
    all_gossips = [] #initialise array vide
    
    CSV.read("./db/gossip.csv").each do |csv_line| # va chercher chacune des lignes du csv do
    all_gossips << Gossip.new(csv_line[0], csv_line[1]) # crée un gossip avec les infos de la ligne
    end
    return all_gossips
  end

  def self.find(id)
    all_gossips = self.all
    all_gossips[id.to_i - 1] #
  end  
  #binding.pry 
  end 
