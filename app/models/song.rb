class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :release_year, presence: true, if: :released?
  validates :release_year, numericality: {less_than: 2017}, if: :released?
  validates :title, uniqueness: true
end
