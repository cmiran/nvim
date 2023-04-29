require('illuminate').configure {
  delay = 50,
  filetypes_denylist = {
    "alpha",
    "NvimTree",
    "qf",
  },
  under_cursor = false,
}
