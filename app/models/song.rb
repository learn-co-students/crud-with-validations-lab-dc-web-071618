class Song < ActiveRecord::Base
    validates :title, presence: true, uniqueness: {scope: :release_year}
    validates :released, inclusion: {in: [true, false]}
    validates :release_year, numericality: {less_than_or_equal_to: 2018}, presence: true, if: :released?
    validates :artist_name, presence: true 

    def released? 
        released 
    end
end
