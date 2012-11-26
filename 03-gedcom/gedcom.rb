class Gedcom
  attr_reader :builder
  def initialize(file_handle, builder)
    @file_handle = file_handle
    @builder = builder
    
    @level = -1
    
    parse(@builder.gedcom)
  end
  
  private
  
  ## Given a file to parse and a builder object
  ## parse the 
  def parse(parent)
    next_node = next_node
    return nil if next_node.nil?
    
    if next_node.level > @level #
      
    end
  end
  
  def next_node
    line = @file_handle.gets
    return nil if line.nil?
    GedcomNode.new( line.chomp! )
  end
end

class GedcomNode
  attr_reader :level, :tag, :id, :data
  def initialize(str)
    m = line.match /^(\d+)\s+(\S+?)\s+(.+)$/
    @level = m[1]
    if m[2][0] == '@' then
      @id = m[2]
    else
      @tag = m[2]
    end
    @data = m[3]
  end
  
  def has_id?
    return @tag.nil?
  end
end