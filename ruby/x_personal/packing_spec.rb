# frozen_string_literal: true

require 'rspec'
require './packing'

describe 'test' do
  it 'is true' do
    # Expectations for rspec tests
    expect(best_fit(['Cam'])).to eq([[:M, ['Cam']]])
    expect(best_fit(['Cam', 'Game'])).to eq([[:M, ['Cam']], [:L, ['Game']]])
    expect(best_fit(['Game', 'Game', 'Blue'])).to eq([[:L, ['Game', 'Game']], [:L, ['Blue']]])
    expect(best_fit(['Cam', 'Cam', 'Game', 'Game'])).to eq([[:L, ['Cam', 'Cam']], [:L, ['Game', 'Game']]])
    expect(
      best_fit(['Cam', 'Cam', 'Cam', 'Game', 'Game', 'Game', 'Cam', 'Blue'])
    ).to eq([[:L, ['Cam', 'Cam']], [:L, ['Cam', 'Cam']], [:L, ['Game', 'Game']], [:L, ['Game']], [:L, ['Blue']]])
    expect(
      best_fit(['Cam', 'Cam', 'Cam', 'Game', 'Game', 'Cam', 'Cam', 'Blue', 'Blue'])
    ).to eq([[:L, ['Cam', 'Cam']], [:L, ['Cam', 'Cam']], [:M, ['Cam']], [:L, ['Game', 'Game']], [:L, ['Blue']], [:L, ['Blue']]])
  end
end
