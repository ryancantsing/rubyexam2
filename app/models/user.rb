class User < ActiveRecord::Base
    has_secure_password
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :first_name, :last_name, presence: true
    validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}, uniqueness: true
    validates :password, presence: true
    before_save :downcase_fields
    def downcase_fields
        self.email.downcase!
    end
    has_many :plays
    has_many :songs, through: :plays
end
