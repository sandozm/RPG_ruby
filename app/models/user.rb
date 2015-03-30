class User < ActiveRecord::Base
	email_regex = %r{
		^ # Start of string
		[0-9a-z] # First character
		[0-9a-z.+]+ # Middle characters
		[0-9a-z] # Last character
		@ # Separating @ character
		[0-9a-z] # Domain name begin
		[0-9a-z.-]+ # Domain name middle
		[0-9a-z] # Domain name end
		$ # End of string
    }xi # Case insensitive
    validates :username, :presence   => true,
    :uniqueness => true

    validates :password, :presence   => true

    validates :email, :presence   => true,
    :format     => { :with => email_regex },
    :uniqueness => true

    before_save :encrypt_password

    has_many :characters

    def has_password?(string)
    	password == encrypt(string)
    end

    private
    def encrypt_password
    	self.salt = make_salt if new_record?
    	self.password = encrypt(password)
    end

    def encrypt(string)
    	secure_hash("#{salt}--#{string}")
    	
    end

    def make_salt
    	secure_hash("#{Time.now.utc}--#{password}")
    end

    def secure_hash(string)
    	Digest::SHA2.hexdigest(string)
    end
end
