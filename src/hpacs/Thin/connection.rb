module Thin
	class Connection < EventMachine::Connection
		def ssl_verify_peer(cert)
			return true
		end
	end
end
