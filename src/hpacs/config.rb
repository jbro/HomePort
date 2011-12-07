module Config
	# HTTP response if no ACE is found for service
	# 403 means deafualt deny
	# 200 means default allow
	#
	Private_key_file = "ssl/server/server.key"
	Server_cert_file = "ssl/server/server.crt"
	Database_file = "acl.db"
end
