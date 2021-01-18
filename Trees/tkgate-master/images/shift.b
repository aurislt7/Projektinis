#define shift_width 117
#define shift_height 151
static unsigned char shift_bits[] = {
   0xc0, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x1f, 0x00, 0xfc, 0x03,
   0x80, 0x7f, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20,
   0x00, 0x02, 0x04, 0x40, 0x80, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00,
   0x00, 0x00, 0x40, 0x00, 0x01, 0x08, 0x20, 0x00, 0x01, 0x08, 0x00, 0x00,
   0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x80, 0x00, 0x10, 0x10, 0x00, 0x02,
   0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x41, 0x00, 0x20,
   0x08, 0x00, 0x04, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
   0x22, 0x00, 0x40, 0x04, 0x00, 0x08, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00,
   0x00, 0x00, 0x00, 0x14, 0x00, 0x80, 0x02, 0x00, 0x10, 0x01, 0x00, 0x00,
   0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x14, 0x00, 0x80, 0x02, 0x00, 0x10,
   0x01, 0x00, 0x00, 0x80, 0x03, 0x00, 0x00, 0x00, 0x00, 0x14, 0x00, 0x80,
   0x02, 0x00, 0x10, 0x01, 0x00, 0x00, 0xc0, 0xff, 0x03, 0x00, 0x00, 0x00,
   0x14, 0x00, 0x80, 0x02, 0x00, 0x10, 0x01, 0x00, 0x00, 0xc0, 0xff, 0x03,
   0x00, 0x00, 0x00, 0x14, 0x00, 0x80, 0x02, 0x00, 0x10, 0x01, 0x00, 0x00,
   0x80, 0x03, 0x00, 0x00, 0x00, 0x00, 0x14, 0x00, 0x80, 0x02, 0x00, 0x10,
   0x01, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x14, 0x00, 0x80,
   0x02, 0x00, 0x10, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00,
   0x14, 0x00, 0x80, 0x02, 0x00, 0x10, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00,
   0x00, 0x00, 0x00, 0x12, 0x00, 0x80, 0x02, 0x00, 0x10, 0x04, 0x00, 0x00,
   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x11, 0x00, 0x80, 0x02, 0x00, 0x10,
   0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x10, 0x00, 0x80,
   0x02, 0x00, 0x10, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x40,
   0x10, 0x00, 0x80, 0x02, 0x00, 0x10, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00,
   0x00, 0x00, 0x20, 0x10, 0x00, 0x80, 0x02, 0x00, 0x10, 0xc0, 0xff, 0xff,
   0xff, 0xff, 0xff, 0xff, 0xff, 0x1f, 0x10, 0x00, 0x80, 0x02, 0x00, 0x10,
   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x80,
   0x02, 0x00, 0x10, 0xc0, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x1f,
   0x10, 0x00, 0x80, 0x02, 0x00, 0x10, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00,
   0x00, 0x00, 0x20, 0x10, 0x00, 0x80, 0x02, 0x00, 0x10, 0x10, 0x00, 0x00,
   0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x10, 0x00, 0x80, 0x02, 0x00, 0x10,
   0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x10, 0x00, 0x80,
   0x02, 0x00, 0x10, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
   0x11, 0x00, 0x80, 0x02, 0x00, 0x10, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00,
   0x00, 0x00, 0x00, 0x12, 0x00, 0x80, 0x02, 0x00, 0x10, 0x01, 0x00, 0x00,
   0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x14, 0x00, 0x80, 0x02, 0x00, 0x10,
   0x01, 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x14, 0x00, 0x80,
   0x02, 0x00, 0x10, 0x01, 0x00, 0x00, 0x00, 0x00, 0x0e, 0x00, 0x00, 0x00,
   0x14, 0x00, 0x80, 0x02, 0x00, 0x10, 0x01, 0x00, 0x00, 0x00, 0xfe, 0x1f,
   0x00, 0x00, 0x00, 0x14, 0x60, 0x80, 0x02, 0x00, 0x10, 0x01, 0x00, 0x00,
   0x00, 0xfe, 0x1f, 0x00, 0x00, 0x00, 0x14, 0xf0, 0x80, 0x02, 0x00, 0x10,
   0x01, 0x00, 0x00, 0x00, 0x00, 0x0e, 0x00, 0x00, 0x00, 0x14, 0xf8, 0x81,
   0x02, 0x00, 0x10, 0x01, 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00,
   0x14, 0xfc, 0x83, 0x02, 0x0c, 0x10, 0x01, 0x00, 0x00, 0x00, 0x00, 0x02,
   0x00, 0x00, 0x00, 0x14, 0x60, 0x80, 0x02, 0x0c, 0x10, 0x02, 0x00, 0x00,
   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x12, 0x60, 0x80, 0x02, 0x0c, 0x10,
   0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x11, 0x60, 0x80,
   0x02, 0x0c, 0x10, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80,
   0x10, 0x60, 0x80, 0x02, 0x0c, 0x10, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00,
   0x00, 0x00, 0x40, 0x10, 0x60, 0x80, 0x02, 0x0c, 0x10, 0x20, 0x00, 0x00,
   0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x10, 0x60, 0x80, 0x02, 0x0c, 0x10,
   0xc0, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x1f, 0x10, 0x60, 0x80,
   0x02, 0x0c, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
   0x10, 0x60, 0x80, 0x82, 0x7f, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
   0x00, 0x00, 0x00, 0x10, 0x00, 0x80, 0x02, 0x3f, 0x10, 0x00, 0x00, 0x00,
   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x80, 0x02, 0x1e, 0x10,
   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x80,
   0x02, 0x0c, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
   0x10, 0x00, 0x80, 0x02, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
   0x00, 0x00, 0x00, 0x10, 0x00, 0x80, 0x02, 0x00, 0x10, 0x00, 0x00, 0x00,
   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x80, 0x02, 0x00, 0x10,
   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x80,
   0x02, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
   0x10, 0x00, 0x80, 0x02, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
   0x00, 0x00, 0x00, 0x10, 0x00, 0x80, 0x02, 0x00, 0x10, 0x00, 0x00, 0x00,
   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x80, 0x02, 0x00, 0x10,
   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x80,
   0x02, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
   0x10, 0x00, 0x80, 0x02, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
   0x00, 0x00, 0x00, 0x10, 0x00, 0x80, 0x02, 0x00, 0x10, 0x00, 0x00, 0x00,
   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x80, 0x02, 0x00, 0x10,
   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x80,
   0x02, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
   0x10, 0x00, 0x80, 0x02, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
   0x00, 0x00, 0x00, 0x10, 0x00, 0x80, 0x02, 0x00, 0x10, 0x00, 0x00, 0x00,
   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x80, 0x02, 0x00, 0x10,
   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x80,
   0x02, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
   0x10, 0x00, 0x80, 0x02, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
   0x00, 0x00, 0x00, 0x10, 0x00, 0x80, 0x02, 0x00, 0x10, 0x00, 0x00, 0x00,
   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x80, 0x02, 0x00, 0x10,
   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x80,
   0x02, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
   0x10, 0x00, 0x80, 0x02, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
   0x00, 0x00, 0x00, 0x10, 0x00, 0x80, 0x02, 0x00, 0x10, 0x00, 0x00, 0x00,
   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x80, 0x02, 0x00, 0x10,
   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x80,
   0x02, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
   0x20, 0x00, 0x40, 0x04, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
   0x00, 0x00, 0x00, 0x40, 0x00, 0x20, 0x08, 0x00, 0x04, 0x00, 0x00, 0x00,
   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x10, 0x10, 0x00, 0x02,
   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x08,
   0x20, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
   0x00, 0x02, 0x04, 0x40, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
   0x00, 0x00, 0x00, 0x00, 0xfc, 0x03, 0x80, 0x7f, 0x00, 0x00, 0x00, 0x00,
   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
   0xc0, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x1f, 0x00, 0xfc, 0x03,
   0x80, 0x7f, 0x00, 0xe0, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x3f,
   0x00, 0xfe, 0x07, 0xc0, 0xff, 0x00, 0x30, 0x00, 0x00, 0x00, 0x00, 0x00,
   0x00, 0x00, 0x60, 0x00, 0x03, 0x0c, 0x60, 0x80, 0x01, 0x18, 0x00, 0x00,
   0x00, 0x00, 0x00, 0x00, 0x00, 0xc0, 0x80, 0x01, 0x18, 0x30, 0x00, 0x03,
   0x0c, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0xc1, 0x00, 0x30,
   0x18, 0x00, 0x06, 0x06, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00,
   0x63, 0x00, 0x60, 0x0c, 0x00, 0x0c, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00,
   0x00, 0x00, 0x00, 0x36, 0x00, 0xc0, 0x06, 0x00, 0x18, 0x03, 0x00, 0x00,
   0x80, 0x03, 0x00, 0x00, 0x00, 0x00, 0x36, 0x00, 0xc0, 0x06, 0x00, 0x18,
   0x03, 0x00, 0x00, 0xc0, 0xff, 0x03, 0x00, 0x00, 0x00, 0x36, 0x00, 0xc0,
   0x06, 0x00, 0x18, 0x03, 0x00, 0x00, 0xe0, 0xff, 0x03, 0x00, 0x00, 0x00,
   0x36, 0x00, 0xc0, 0x06, 0x00, 0x18, 0x03, 0x00, 0x00, 0xe0, 0xff, 0x03,
   0x00, 0x00, 0x00, 0x36, 0x00, 0xc0, 0x06, 0x00, 0x18, 0x03, 0x00, 0x00,
   0xc0, 0xff, 0x03, 0x00, 0x00, 0x00, 0x36, 0x00, 0xc0, 0x06, 0x00, 0x18,
   0x03, 0x00, 0x00, 0x80, 0x03, 0x00, 0x00, 0x00, 0x00, 0x36, 0x00, 0xc0,
   0x06, 0x00, 0x18, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00,
   0x36, 0x00, 0xc0, 0x06, 0x00, 0x18, 0x06, 0x00, 0x00, 0x00, 0x02, 0x00,
   0x00, 0x00, 0x00, 0x33, 0x00, 0xc0, 0x06, 0x00, 0x18, 0x0c, 0x00, 0x00,
   0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x31, 0x00, 0xc0, 0x06, 0x00, 0x18,
   0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xc0, 0x30, 0x00, 0xc0,
   0x06, 0x00, 0x18, 0x30, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x60,
   0x30, 0x00, 0xc0, 0x06, 0x00, 0x18, 0xe0, 0xff, 0xff, 0xff, 0xff, 0xff,
   0xff, 0xff, 0x3f, 0x30, 0x00, 0xc0, 0x06, 0x00, 0x18, 0xc0, 0xff, 0xff,
   0xff, 0xff, 0xff, 0xff, 0xff, 0x1f, 0x30, 0x00, 0xc0, 0x06, 0x00, 0x18,
   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x30, 0x00, 0xc0,
   0x06, 0x00, 0x18, 0xc0, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x1f,
   0x30, 0x00, 0xc0, 0x06, 0x00, 0x18, 0xe0, 0xff, 0xff, 0xff, 0xff, 0xff,
   0xff, 0xff, 0x3f, 0x30, 0x00, 0xc0, 0x06, 0x00, 0x18, 0x30, 0x00, 0x00,
   0x00, 0x00, 0x00, 0x00, 0x00, 0x60, 0x30, 0x00, 0xc0, 0x06, 0x00, 0x18,
   0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xc0, 0x30, 0x00, 0xc0,
   0x06, 0x00, 0x18, 0x0c, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80,
   0x31, 0x00, 0xc0, 0x06, 0x00, 0x18, 0x06, 0x00, 0x00, 0x00, 0x00, 0x02,
   0x00, 0x00, 0x00, 0x33, 0x00, 0xc0, 0x06, 0x00, 0x18, 0x03, 0x00, 0x00,
   0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x36, 0x00, 0xc0, 0x06, 0x00, 0x18,
   0x03, 0x00, 0x00, 0x00, 0x00, 0x0e, 0x00, 0x00, 0x00, 0x36, 0x00, 0xc0,
   0x06, 0x00, 0x18, 0x03, 0x00, 0x00, 0x00, 0xfe, 0x1f, 0x00, 0x00, 0x00,
   0x36, 0x60, 0xc0, 0x06, 0x00, 0x18, 0x03, 0x00, 0x00, 0x00, 0xfe, 0x3f,
   0x00, 0x00, 0x00, 0x36, 0xf0, 0xc0, 0x06, 0x00, 0x18, 0x03, 0x00, 0x00,
   0x00, 0xfe, 0x3f, 0x00, 0x00, 0x00, 0x36, 0xf8, 0xc1, 0x06, 0x00, 0x18,
   0x03, 0x00, 0x00, 0x00, 0xfe, 0x1f, 0x00, 0x00, 0x00, 0x36, 0xfc, 0xc3,
   0x06, 0x00, 0x18, 0x03, 0x00, 0x00, 0x00, 0x00, 0x0e, 0x00, 0x00, 0x00,
   0x36, 0xfe, 0xc7, 0x06, 0x1e, 0x18, 0x03, 0x00, 0x00, 0x00, 0x00, 0x06,
   0x00, 0x00, 0x00, 0x36, 0xf0, 0xc0, 0x06, 0x1e, 0x18, 0x06, 0x00, 0x00,
   0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x33, 0xf0, 0xc0, 0x06, 0x1e, 0x18,
   0x0c, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x31, 0xf0, 0xc0,
   0x06, 0x1e, 0x18, 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xc0,
   0x30, 0xf0, 0xc0, 0x06, 0x1e, 0x18, 0x30, 0x00, 0x00, 0x00, 0x00, 0x00,
   0x00, 0x00, 0x60, 0x30, 0xf0, 0xc0, 0x06, 0x1e, 0x18, 0xe0, 0xff, 0xff,
   0xff, 0xff, 0xff, 0xff, 0xff, 0x3f, 0x30, 0xf0, 0xc0, 0x06, 0x1e, 0x18,
   0xc0, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x1f, 0x30, 0xf0, 0xc0,
   0x06, 0x1e, 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
   0x30, 0xf0, 0xc0, 0xc6, 0xff, 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
   0x00, 0x00, 0x00, 0x30, 0x00, 0xc0, 0x86, 0x7f, 0x18, 0x00, 0x00, 0x00,
   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x30, 0x00, 0xc0, 0x06, 0x3f, 0x18,
   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x30, 0x00, 0xc0,
   0x06, 0x1e, 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
   0x30, 0x00, 0xc0, 0x06, 0x0c, 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
   0x00, 0x00, 0x00, 0x30, 0x00, 0xc0, 0x06, 0x00, 0x18, 0x00, 0x00, 0x00,
   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x30, 0x00, 0xc0, 0x06, 0x00, 0x18,
   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x30, 0x00, 0xc0,
   0x06, 0x00, 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
   0x30, 0x00, 0xc0, 0x06, 0x00, 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
   0x00, 0x00, 0x00, 0x30, 0x00, 0xc0, 0x06, 0x00, 0x18, 0x00, 0x00, 0x00,
   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x30, 0x00, 0xc0, 0x06, 0x00, 0x18,
   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x30, 0x00, 0xc0,
   0x06, 0x00, 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
   0x30, 0x00, 0xc0, 0x06, 0x00, 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
   0x00, 0x00, 0x00, 0x30, 0x00, 0xc0, 0x06, 0x00, 0x18, 0x00, 0x00, 0x00,
   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x30, 0x00, 0xc0, 0x06, 0x00, 0x18,
   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x30, 0x00, 0xc0,
   0x06, 0x00, 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
   0x30, 0x00, 0xc0, 0x06, 0x00, 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
   0x00, 0x00, 0x00, 0x30, 0x00, 0xc0, 0x06, 0x00, 0x18, 0x00, 0x00, 0x00,
   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x30, 0x00, 0xc0, 0x06, 0x00, 0x18,
   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x30, 0x00, 0xc0,
   0x06, 0x00, 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
   0x30, 0x00, 0xc0, 0x06, 0x00, 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
   0x00, 0x00, 0x00, 0x30, 0x00, 0xc0, 0x06, 0x00, 0x18, 0x00, 0x00, 0x00,
   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x30, 0x00, 0xc0, 0x06, 0x00, 0x18,
   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x30, 0x00, 0xc0,
   0x06, 0x00, 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
   0x30, 0x00, 0xc0, 0x06, 0x00, 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
   0x00, 0x00, 0x00, 0x30, 0x00, 0xc0, 0x06, 0x00, 0x18, 0x00, 0x00, 0x00,
   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x30, 0x00, 0xc0, 0x06, 0x00, 0x18,
   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x30, 0x00, 0xc0,
   0x06, 0x00, 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
   0x60, 0x00, 0x60, 0x0c, 0x00, 0x0c, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
   0x00, 0x00, 0x00, 0xc0, 0x00, 0x30, 0x18, 0x00, 0x06, 0x00, 0x00, 0x00,
   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x01, 0x18, 0x30, 0x00, 0x03,
   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x0c,
   0x60, 0x80, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
   0x00, 0xfe, 0x07, 0xc0, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
   0x00, 0x00, 0x00, 0x00, 0xfc, 0x03, 0x80, 0x7f, 0x00};