note
	description: "[
	]"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS_32

create
	make

feature {NONE} -- Initialization

	make
			-- Run application.
		local
			width: INTEGER
			data: STRING
			buffer: STRING
			y, y_index: INTEGER
			x: INTEGER
			v: NATURAL
			i: INTEGER
			iy, iy_index : INTEGER
			ix: INTEGER
		do

			if attached {QRCODE_STRUCT_API} {QRENCODE_FUNCTIONS}.qrcode_encode_string ("EiffelQRencode", 0, {QREC_LEVEL_ENUM_API}.QR_ECLEVEL_L, {QRENCODE_MODE_ENUM_API}.QR_MODE_8, 1) as l_qrcode then
				width := l_qrcode.width * ZOOM_SIZE
				if attached l_qrcode.data as l_data then
					data := l_data.string
					create buffer.make_filled ('1',{PLATFORM}.character_8_bytes * width * width)
					print ("P1%N" + width.out + " " +width.out +"%N")
					from
						i := 1
						y := 0
					until
						y >= width
					loop
						y_index := y * width
						from
							x := 0
						until
							x >= width
						loop
							v := if (data[i].code & 1) /= 0 then 1 else 0 end
							from
								iy := 0
							until
								iy >= ZOOM_SIZE
							loop
								iy_index := y_index + iy * width
								from
									ix := 0
								until
									ix >= ZOOM_SIZE
								loop
									buffer.put_code (v, iy_index + (x + ix) + 1)
									ix := ix + 1
								end
								iy := iy + 1
							end
							x := x + ZOOM_SIZE
							i := i + 1
						end
						y := y + ZOOM_SIZE
					end

					from
						y := 0
					until
						y >= width
					loop
						from
							x := 0
						until
							x >= width
						loop
							print(buffer[(y*width + x) + 1])
							print(" ")
							x := x + 1
						end
						io.put_new_line
						y := y + 1
					end

					{QRENCODE_FUNCTIONS}.QRcode_free (l_qrcode)

				end
			end
		end

feature -- Constant

		ZOOM_SIZE: INTEGER = 2

end
