require 'ffi'
module Homeport
	extend FFI::Library
	ffi_lib "libhpd"

	class HPD_FLAG
		HPD_NO_FLAG = 0
		HPD_USE_OPTION = 1
		HPD_USE_CFG_FILE = 2
		HPD_USE_DEFAULT = 4
	end

	class HPD_OPTION
		HPD_OPTION_END = 0
		HPD_OPTION_HTTP = 1
		HPD_OPTION_HTTPS = 2
		HPD_OPTION_LOG = 3
		HPD_OPTION_CFG_PATH = 4
	end

	HPD_NON_SECURE_DEVICE = 0
	HPD_SECURE_DEVICE = 1

	attach_function 'HPD_start', [:uint, :string, :varargs], :int
	attach_function 'HPD_stop', [], :int

	attach_function 'create_device_struct', [:string, :string, :string, :string, :string, :string, :string, :string, :string, :int], :pointer 
	attach_function 'destroy_device_struct', [ :pointer ], :int
	attach_function 'create_service_struct', [ :string, :string, :string, :string, :pointer, :pointer, :pointer, :pointer], :pointer 
	attach_function 'destroy_service_struct', [ :pointer ], :int

	attach_function 'HPD_register_service', [ :pointer ], :int
	attach_function 'HPD_unregister_service', [ :pointer ], :int
	attach_function 'HPD_register_device_services', [ :pointer ], :int
	attach_function 'HPD_unregister_device_services', [ :pointer ], :int
	attach_function 'HPD_send_event_of_value_change',  [ :pointer, :string ], :int
end
