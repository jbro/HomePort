class Service
	include DataMapper::Resource

	property :id, Serial
	property :url, String, :required => true
	
	has n, :ace
end

class Ace
	include DataMapper::Resource

	property :id, Serial
	property :cert, String, :required => true
	property :get, Boolean, :default => false
	property :put, Boolean, :default => false
	property :post, Boolean, :default => false
	property :del, Boolean, :default => false

	belongs_to :service
end
