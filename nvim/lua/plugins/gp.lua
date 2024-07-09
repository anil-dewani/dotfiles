return {
  {
    "robitx/gp.nvim",
    config = function()
      require("gp").setup()
      openai_api_key = os.getenv("OPENAI_API_KEY")

      -- or setup with your own config (see Install > Configuration in Readme)
      -- require("gp").setup(conf)

      -- shortcuts might be setup here (see Usage > Shortcuts in Readme)
    end,
  },
}
