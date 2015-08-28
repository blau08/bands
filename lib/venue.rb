class Venue < ActiveRecord::Base
  validates(:name, :presence => true)
  has_and_belongs_to_many(:bands)
  has_and_belongs_to_many(:concerts)
  before_save(:format_name)

  private

  def format_name
    venue_words = self.name.split(" ")
    updated_words = []
    venue_words.each do |word|
      updated_words.push(word.downcase.capitalize)
    end
    self.name = updated_words.join(" ")
  end
end
