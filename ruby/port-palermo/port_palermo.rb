module Port
  IDENTIFIER = :PALE
  # TODO: define the 'IDENTIFIER' constant

  def self.get_identifier(city)
    city[0...4].upcase.to_sym
  end

  def self.get_terminal(ship_identifier)
    ship_contents = ship_identifier[0...3]
    case ship_contents
    when 'OIL', 'GAS'
      return :A
    else
      :B
    end
  end
end
