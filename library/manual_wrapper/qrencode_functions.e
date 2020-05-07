note
	description: "Summary description for {QRENCODE_FUNCTIONS}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	QRENCODE_FUNCTIONS

inherit

	QRENCODE_FUNCTIONS_API
		rename
			qrcode_apiversion_string as qrcode_apiversion_string_api,
			qrcode_encode_string as qrcode_encode_string_api,
			qrcode_encode_string8bit as qrcode_encode_string8bit_api,
			qrinput_append as qrinput_append_api,
			qrinput_new2 as qrinput_new2_api,
			qrcode_encode_input as qrcode_encode_input_api
		end

feature -- Access

	qrcode_apiversion_string: STRING
			-- Return a string that identifies the library version.
		do
			create Result.make_from_c (qrcode_apiversion_string_api)
		ensure
			instance_free: class
		end

	qrcode_encode_string (string: detachable STRING; version: INTEGER; level: INTEGER; hint: INTEGER; casesensitive: INTEGER): detachable QRCODE_STRUCT_API
		local
			string_c_string: C_STRING
			l_string_ptr: POINTER
		do
			if attached string  then
				create string_c_string.make (string)
				l_string_ptr := string_c_string.item
			end

			if attached c_qrcode_encode_string (l_string_ptr, version, level, hint, casesensitive) as l_ptr and then not l_ptr.is_default_pointer then
				create Result.make_by_pointer ( l_ptr )
			end
		ensure
			instance_free: class
		end

	qrcode_encode_string8bit (string: detachable STRING; version: INTEGER; level: INTEGER): detachable QRCODE_STRUCT_API
		local
			string_c_string: C_STRING
			string_ptr: POINTER
		do
			if attached string then
				create string_c_string.make (string)
				string_ptr := string_c_string.item
			end

			if attached c_qrcode_encode_string8bit (string_ptr, version, level) as l_ptr and then not l_ptr.is_default_pointer then
				create Result.make_by_pointer ( l_ptr )
			end
		ensure
			instance_free: class
		end

	qrinput_append (input: QRINPUT_STRUCT_API; mode: INTEGER; size: INTEGER; data: STRING): INTEGER
		local
			data_c_string: C_STRING
		do
			create data_c_string.make (data)
			Result := c_qrinput_append (input.item, mode, size, data_c_string.item)
		ensure
			instance_free: class
		end

	qrinput_new2 (version: INTEGER; level: INTEGER): detachable QRINPUT_STRUCT_API
		do
			if attached c_qrinput_new2 (version, level) as l_ptr and then not l_ptr.is_default_pointer then
				create Result.make_by_pointer ( l_ptr )
			end
		ensure
			instance_free: class
		end

	qrcode_encode_input (input: QRINPUT_STRUCT_API): detachable QRCODE_STRUCT_API
		do
			if attached c_qrcode_encode_input (input.item) as l_ptr and then not l_ptr.is_default_pointer then
				create Result.make_by_pointer ( l_ptr )
			end
		ensure
			instance_free: class
		end



end
