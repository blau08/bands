require('spec_helper')

describe(Band) do
  describe('#concerts') do
    it('lists a list of concerts') do
      test_band = Band.create(:name => "Freddie Mercury")
      test_concert = Concert.create(:name => "Live Aid")
      test_band.concerts.push(test_concert)
      expect(test_band.concerts()).to(eq([test_concert]))
    end
  end
  it{should have_and_belong_to_many(:concerts)}
  it{should have_and_belong_to_many(:venues)}
end
