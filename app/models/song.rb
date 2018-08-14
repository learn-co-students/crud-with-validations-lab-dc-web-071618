class Song < ActiveRecord::Base
  #invalid without a title
  validates :title, presence: true

  #is invalid if an artist tries to release the same song twice in a year
  validates :title, uniqueness: {scope: [:release_year, :artist_name]}

  #is invalid without release year when released is true
  #is invalid when the release year is in the future
  validates :release_year, numericality: {less_than_or_equal_to: Date.today.year}, presence: true, if: :released?




  # validates :released, inclusion: {in: [true, false]}
  # validates :artist_name, presence: true

  def released?
    released
  end



end
