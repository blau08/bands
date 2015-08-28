class Band < ActiveRecord::Base
  validates(:name, :presence => true)
  validates :name, uniqueness: true
  has_and_belongs_to_many(:concerts)
  has_and_belongs_to_many(:venues)
  before_save(:upcase_band)

  private

  def upcase_band
    band_words = self.name.split(" ")
    updated_words = []
    band_words.each do |word|
      updated_words.push(word.downcase.capitalize)
    end
    self.name = updated_words.join(" ")
  end
end
