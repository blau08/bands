class Band < ActiveRecord::Base
  validates(:name, :presence => true)
  validates :name, uniqueness: true
  has_and_belongs_to_many(:concerts)
  has_and_belongs_to_many(:venues)
end
