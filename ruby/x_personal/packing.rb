require 'awesome_print'
require 'rspec'

FIT_MAP = {
  M: {
    "Cam" => 1,
  },
  L: {
    "Cam" => 2,
    "Game" => 2,
    "Blue" => 1,
  }
}
def best_fit(items)
  result = []

  cams = items.select { |item| item == "Cam" }
  games = items.select { |item| item == "Game" }
  blues = items.select { |item| item == "Blue" }

  # Pack cameras (max 1 per medium box and 2 per large box)
  # split item array into groups of two
  cams.each_slice(2) do |items|
    if items.length == 2
      result << [:L, items]
    else
      result << [:M, items]
    end
  end


  # Pack games (max 2 per large box)
  games.each_slice(2) do |items|
    result << [:L, items]
  end

  # Pack Blue (max 1 per large box)
  blues.each_slice(1) do |items|
    result << [:L, items]
  end

  result
end

