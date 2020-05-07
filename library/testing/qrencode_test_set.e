note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	QRENCODE_TEST_SET

inherit

	EQA_TEST_SET

feature -- Test routines

	test_version
			-- New test routine
		local
			major_version, minor_version, micro_version: INTEGER
		do
			assert ("Version not empty", not {QRENCODE_FUNCTIONS}.qrcode_apiversion_string.is_empty)

			{QRENCODE_FUNCTIONS}.c_qrcode_apiversion ($major_version, $minor_version, $micro_version )
		end

	test_encode_null
		local
			qrcode: QRCODE_STRUCT_API
		do
			qrcode := {QRENCODE_FUNCTIONS}.qrcode_encode_string (Void, 0, {QREC_LEVEL_ENUM_API}.QR_ECLEVEL_H, {QRENCODE_MODE_ENUM_API}.QR_MODE_8, 0)
			assert ("Expected null", qrcode = Void)
		end


	test_encode_empty
		local
			qrcode: QRCODE_STRUCT_API
		do
			qrcode := {QRENCODE_FUNCTIONS}.qrcode_encode_string ("", 0, {QREC_LEVEL_ENUM_API}.QR_ECLEVEL_H, {QRENCODE_MODE_ENUM_API}.QR_MODE_8, 0)
			assert ("Expected null", qrcode = Void )
		end

	test_encode_null_8
		local
			qrcode: QRCODE_STRUCT_API
		do
			qrcode := {QRENCODE_FUNCTIONS}.qrcode_encode_string8bit (Void, 0, {QREC_LEVEL_ENUM_API}.QR_ECLEVEL_H)
			assert ("Expected null", qrcode = Void )
		end

	test_encode_empty_8
		local
			qrcode: QRCODE_STRUCT_API
		do
			qrcode := {QRENCODE_FUNCTIONS}.qrcode_encode_string8bit ("", 0, {QREC_LEVEL_ENUM_API}.QR_ECLEVEL_H)
			assert ("Expected null", qrcode = Void )
		end


	test_print_01234567
		local
			stream: QRINPUT_STRUCT_API
			qrcode: QRCODE_STRUCT_API
			num: STRING
			res: INTEGER
		do
			num := "01234567"
			print ("Printing QR code of '01234567'%N")
			stream := {QRENCODE_FUNCTIONS}.qrinput_new2 (1, {QREC_LEVEL_ENUM_API}.QR_ECLEVEL_M)
			if stream /= Void then
				res := {QRENCODE_FUNCTIONS}.qrinput_append (stream, {QRENCODE_MODE_ENUM_API}.qr_mode_num, 8, num)
				qrcode := {QRENCODE_FUNCTIONS}.qrcode_encode_input (stream)
				if qrcode /= Void then
					print_qr_code (qrcode)
				end
			end
		end


	print_qr_code (a_code: QRCODE_STRUCT_API)
		do
			if attached a_code.data as l_data then
				print_frame (a_code.width, l_data)
			end
		end

	print_frame (a_width: INTEGER; a_data: C_STRING)
		local
			i: INTEGER
			x: INTEGER
			fi: FORMAT_INTEGER
			l_area: SPECIAL [CHARACTER_8]

		do
			l_area := a_data.string.area
			create fi.make (2)
			from
				i := 0
			until
				i = a_width
			loop
				from
					x := 0
				until
					x = a_width
				loop
					print (fi.formatted (l_area[x].code) +" ")
					x := x + 1
				end
				print ("%N")
				i := i + 1
			end
		end



end


