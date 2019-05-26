class Song < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :artist_name, presence: true
  validates :released, inclusion: {in:[true, false]}
  validates :release_year, presence: true,  if: :released_already?, numericality: {less_than_or_equal_to: Time.now.year}
  
  def released_already?
    released == true
  end
end
