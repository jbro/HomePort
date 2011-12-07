require 'thin'
require 'data_mapper'

require './Thin/connection'

require './models/model.rb'

require './apps/acmanager'
require './apps/aclookup'

DataMapper.setup(:default, "sqlite3://" + Dir.getwd + "/" + Config::Database_file)
DataMapper.finalize
DataMapper.auto_upgrade!

server = Thin::Server.new('0.0.0.0', 3000) do
	map "/check" do
		run AClookup.new
	end
	map "/manage" do
		run ACmanager.new
	end
end

server.ssl = true
server.ssl_options = {:private_key_file => Config::Private_key_file, 
	:cert_chain_file => Config::Server_cert_file, :verify_peer => true} 
server.start
