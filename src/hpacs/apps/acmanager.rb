require './config'

class ACmanager
	def call(env)
		path = env['PATH_INFO'].chomp("/")

		case env['REQUEST_METHOD']
		when "GET"
			puts "hest"
			if path == ""
				return [
						200,
						{'Content-Type' => 'text/html'},
						[list(nil, nil)]
					   ]
			end
		when "PUT"

		when "POST"
			if path == ""
				cert = env['rack.input'].read
				
			end

		when "DELETE"
		else
		end

	end

	def parse_query_string(qstring)
		s = Hash[*qstring.split(/=|&/)]
		return s['get'], s['put'], s['post'], s['del'], 
	end

	def lookup(cert)
		puts cert
	end

	def add(cert, service, get, put, post, del)
		puts cert
		puts service
		puts get
		puts put
		puts post
		puts del
	end

	def remove(cert, service)
		puts cert
		puts service
	end

	def change(cert, service, get, put, post, del)
		puts cert
		puts service
		puts get
		puts put
		puts post
		puts del
	end

	def list(cert, service)
		"abe"
	end

end
