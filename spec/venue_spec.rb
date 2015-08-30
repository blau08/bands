require('spec_helper')

describe(Venue) do
  describe('#bands') do
    it('lists a list of bands for a venue') do
      test_venue = Venue.create(:name => "England")
      test_band = Band.create(:name => "Brian Lau")
      test_venue.bands.push(test_band)
      expect(test_venue.bands()).to(eq([test_band]))
    end
  end
  it{should have_and_belong_to_many(:bands)}
  it{should have_and_belong_to_many(:concerts)}
end
