require('spec_helper')

describe(Concert) do
  describe('#bands') do
    it('lists a list of bands for a concert') do
      test_concert = Concert.create(:name => "Live Aid")
      test_band = Band.create(:name => "Queen")
      test_concert.bands.push(test_band)
      expect(test_concert.bands()).to(eq([test_band]))
    end
  end
end
