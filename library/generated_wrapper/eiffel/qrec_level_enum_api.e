-- enum wrapper
class QREC_LEVEL_ENUM_API

feature {ANY}

	is_valid_enum (a_value: INTEGER): BOOLEAN 
			-- Is `a_value' a valid integer code for this enum ?
		do
			Result := a_value = qr_eclevel_l or a_value = qr_eclevel_m or a_value = qr_eclevel_q or a_value = qr_eclevel_h
		end

	qr_eclevel_l: INTEGER 
		external
			"C inline use <qrencode.h>"
		alias
			"QR_ECLEVEL_L"
		end

	qr_eclevel_m: INTEGER 
		external
			"C inline use <qrencode.h>"
		alias
			"QR_ECLEVEL_M"
		end

	qr_eclevel_q: INTEGER 
		external
			"C inline use <qrencode.h>"
		alias
			"QR_ECLEVEL_Q"
		end

	qr_eclevel_h: INTEGER 
		external
			"C inline use <qrencode.h>"
		alias
			"QR_ECLEVEL_H"
		end

end
