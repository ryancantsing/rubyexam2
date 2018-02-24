class Song < ActiveRecord::Base
    validates :title, :artist, presence: true
    validates_length_of :title, :artist, :minimum => 2, :too_short => "please enter at least 2 characters for each field" 
    has_many :plays
    has_many :users, through: :plays
end
