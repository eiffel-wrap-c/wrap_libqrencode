-- enum wrapper
class QRENCODE_MODE_ENUM_API

feature {ANY}

	is_valid_enum (a_value: INTEGER): BOOLEAN 
			-- Is `a_value' a valid integer code for this enum ?
		do
			Result := a_value = qr_mode_nul or a_value = qr_mode_num or a_value = qr_mode_an or a_value = qr_mode_8 or a_value = qr_mode_kanji or a_value = qr_mode_structure or a_value = qr_mode_eci or a_value = qr_mode_fnc1first or a_value = qr_mode_fnc1second
		end

	qr_mode_nul: INTEGER 
		external
			"C inline use <qrencode.h>"
		alias
			"QR_MODE_NUL"
		end

	qr_mode_num: INTEGER 
		external
			"C inline use <qrencode.h>"
		alias
			"QR_MODE_NUM"
		end

	qr_mode_an: INTEGER 
		external
			"C inline use <qrencode.h>"
		alias
			"QR_MODE_AN"
		end

	qr_mode_8: INTEGER 
		external
			"C inline use <qrencode.h>"
		alias
			"QR_MODE_8"
		end

	qr_mode_kanji: INTEGER 
		external
			"C inline use <qrencode.h>"
		alias
			"QR_MODE_KANJI"
		end

	qr_mode_structure: INTEGER 
		external
			"C inline use <qrencode.h>"
		alias
			"QR_MODE_STRUCTURE"
		end

	qr_mode_eci: INTEGER 
		external
			"C inline use <qrencode.h>"
		alias
			"QR_MODE_ECI"
		end

	qr_mode_fnc1first: INTEGER 
		external
			"C inline use <qrencode.h>"
		alias
			"QR_MODE_FNC1FIRST"
		end

	qr_mode_fnc1second: INTEGER 
		external
			"C inline use <qrencode.h>"
		alias
			"QR_MODE_FNC1SECOND"
		end

end
