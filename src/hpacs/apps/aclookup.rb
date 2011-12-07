require './config'

class AClookup 
	def call(env)
		cert = env['rack.peer_cert']
		puts cert
		
		if cert == nil
			return [
				403, 
				{'Content-Type' => 'text/html'}, 
				["Please use certificate.\n"]
			]
		end
	end
end
