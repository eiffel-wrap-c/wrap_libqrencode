# 1 "/usr/local/include/qrencode.h"
# 1 "<built-in>"
# 1 "<command-line>"
# 31 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 32 "<command-line>" 2
# 1 "/usr/local/include/qrencode.h"
# 109 "/usr/local/include/qrencode.h"
typedef enum {
 QR_MODE_NUL = -1,
 QR_MODE_NUM = 0,
 QR_MODE_AN,
 QR_MODE_8,
 QR_MODE_KANJI,
 QR_MODE_STRUCTURE,
 QR_MODE_ECI,
 QR_MODE_FNC1FIRST,
 QR_MODE_FNC1SECOND,
} QRencodeMode;




typedef enum {
 QR_ECLEVEL_L = 0,
 QR_ECLEVEL_M,
 QR_ECLEVEL_Q,
 QR_ECLEVEL_H
} QRecLevel;
# 152 "/usr/local/include/qrencode.h"
typedef struct _QRinput QRinput;
# 161 "/usr/local/include/qrencode.h"
extern QRinput *QRinput_new(void);
# 172 "/usr/local/include/qrencode.h"
extern QRinput *QRinput_new2(int version, QRecLevel level);
# 184 "/usr/local/include/qrencode.h"
extern QRinput *QRinput_newMQR(int version, QRecLevel level);
# 200 "/usr/local/include/qrencode.h"
extern int QRinput_append(QRinput *input, QRencodeMode mode, int size, const unsigned char *data);
# 213 "/usr/local/include/qrencode.h"
extern int QRinput_appendECIheader(QRinput *input, unsigned int ecinum);






extern int QRinput_getVersion(QRinput *input);
# 230 "/usr/local/include/qrencode.h"
extern int QRinput_setVersion(QRinput *input, int version);






extern QRecLevel QRinput_getErrorCorrectionLevel(QRinput *input);
# 247 "/usr/local/include/qrencode.h"
extern int QRinput_setErrorCorrectionLevel(QRinput *input, QRecLevel level);
# 258 "/usr/local/include/qrencode.h"
extern int QRinput_setVersionAndErrorCorrectionLevel(QRinput *input, int version, QRecLevel level);






extern void QRinput_free(QRinput *input);
# 275 "/usr/local/include/qrencode.h"
extern int QRinput_check(QRencodeMode mode, int size, const unsigned char *data);




typedef struct _QRinput_Struct QRinput_Struct;







extern QRinput_Struct *QRinput_Struct_new(void);






extern void QRinput_Struct_setParity(QRinput_Struct *s, unsigned char parity);
# 308 "/usr/local/include/qrencode.h"
extern int QRinput_Struct_appendInput(QRinput_Struct *s, QRinput *input);





extern void QRinput_Struct_free(QRinput_Struct *s);
# 328 "/usr/local/include/qrencode.h"
extern QRinput_Struct *QRinput_splitQRinputToStruct(QRinput *input);
# 340 "/usr/local/include/qrencode.h"
extern int QRinput_Struct_insertStructuredAppendHeaders(QRinput_Struct *s);




extern int QRinput_setFNC1First(QRinput *input);




extern int QRinput_setFNC1Second(QRinput *input, unsigned char appid);
# 375 "/usr/local/include/qrencode.h"
typedef struct {
 int version;
 int width;
 unsigned char *data;
} QRcode;





typedef struct _QRcode_List {
 QRcode *code;
 struct _QRcode_List *next;
} QRcode_List;
# 401 "/usr/local/include/qrencode.h"
extern QRcode *QRcode_encodeInput(QRinput *input);
# 426 "/usr/local/include/qrencode.h"
extern QRcode *QRcode_encodeString(const char *string, int version, QRecLevel level, QRencodeMode hint, int casesensitive);





extern QRcode *QRcode_encodeString8bit(const char *string, int version, QRecLevel level);





extern QRcode *QRcode_encodeStringMQR(const char *string, int version, QRecLevel level, QRencodeMode hint, int casesensitive);





extern QRcode *QRcode_encodeString8bitMQR(const char *string, int version, QRecLevel level);
# 458 "/usr/local/include/qrencode.h"
extern QRcode *QRcode_encodeData(int size, const unsigned char *data, int version, QRecLevel level);





extern QRcode *QRcode_encodeDataMQR(int size, const unsigned char *data, int version, QRecLevel level);





extern void QRcode_free(QRcode *qrcode);







extern QRcode_List *QRcode_encodeInputStructured(QRinput_Struct *s);
# 499 "/usr/local/include/qrencode.h"
extern QRcode_List *QRcode_encodeStringStructured(const char *string, int version, QRecLevel level, QRencodeMode hint, int casesensitive);





extern QRcode_List *QRcode_encodeString8bitStructured(const char *string, int version, QRecLevel level);
# 520 "/usr/local/include/qrencode.h"
extern QRcode_List *QRcode_encodeDataStructured(int size, const unsigned char *data, int version, QRecLevel level);






extern int QRcode_List_size(QRcode_List *qrlist);





extern void QRcode_List_free(QRcode_List *qrlist);
# 546 "/usr/local/include/qrencode.h"
extern void QRcode_APIVersion(int *major_version, int *minor_version, int *micro_version);






extern char *QRcode_APIVersionString(void);





extern void QRcode_clearCache(void) __attribute__ ((deprecated));
