# frozen_string_literal: true

X_SIZE = 160
Y_SIZE = 168

CMDS = {
  pic_color: 0xf0,
  disable_pic: 0xf1,
  pri_color: 0xf2,
  disable_pri: 0xf3,
  y_corner: 0xf4,
  x_corner: 0xf5,
  abs_line: 0xf6,
  rel_line: 0xf7,
  fill: 0xf8,
  brush_style: 0xf9,
  brush_draw: 0xfa,
  end: 0xff
}

COLORS = {
  0 => "#000000",
  1 => "#0000aa",
  2 => "#00aa00",
  3 => "#00aaaa",
  4 => "#aa0000",
  5 => "#aa00aa",
  6 => "#aa5500",
  7 => "#aaaaaa",
  8 => "#555555",
  9 => "#5555ff",
  10 => "#55ff55",
  11 => "#55ffff",
  12 => "#ff5555",
  13 => "#ff55ff",
  14 => "#ffff55",
  15 => "#ffffff"
}

IM_COLORS = {}
COLORS.each do |k, v|
  IM_COLORS[k] = Magick::Pixel.from_color(v)
end

BINARY_PAT = [
  0x8000, 0x4000, 0x2000, 0x1000, 0x800, 0x400, 0x200, 0x100, 0x80, 0x40, 0x20, 0x10, 0x8,
  0x4, 0x2, 0x1
]

CIRCLE_PAT = [0, 1, 4, 9, 16, 25, 37, 50]

CIRCLE_DATA = [
  0x8000, 0xE000, 0xE000, 0xE000, 0x7000, 0xF800, 0x0F800, 0x0F800, 0x7000, 0x3800, 0x7C00,
  0x0FE00, 0x0FE00, 0x0FE00, 0x7C00, 0x3800, 0x1C00, 0x7F00, 0x0FF80, 0x0FF80, 0x0FF80,
  0x0FF80, 0x0FF80, 0x7F00, 0x1C00, 0x0E00, 0x3F80, 0x7FC0, 0x7FC0, 0x0FFE0, 0x0FFE0,
  0x0FFE0, 0x7FC0, 0x7FC0, 0x3F80, 0x1F00, 0x0E00, 0x0F80, 0x3FE0, 0x7FF0, 0x7FF0, 0x0FFF8,
  0x0FFF8, 0x0FFF8, 0x0FFF8, 0x0FFF8, 0x7FF0, 0x7FF0, 0x3FE0, 0x0F80, 0x07C0, 0x1FF0, 0x3FF8,
  0x7FFC, 0x7FFC, 0x0FFFE, 0x0FFFE, 0x0FFFE, 0x0FFFE, 0x0FFFE, 0x7FFC, 0x7FFC, 0x3FF8,
  0x1FF0, 0x07C0
]

