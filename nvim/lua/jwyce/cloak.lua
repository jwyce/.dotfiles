require('cloak').setup({
  enabled = true,
  patterns = {
    {
      file_pattern = '.*env*',
      cloak_pattern = '=.+'
    },
  },
})

