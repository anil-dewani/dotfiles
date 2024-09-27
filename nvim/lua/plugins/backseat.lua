return {
  {
    "james1236/backseat.nvim",
    config = function()
      require("backseat").setup({
        -- Alternatively, set the env var $OPENAI_API_KEY by putting "export OPENAI_API_KEY=sk-xxxxx" in your ~/.bashrc
        openai_api_key = "", -- Get yours from platform.openai.com/account/api-keys
        openai_model_id = "gpt-4", --gpt-4 (If you do not have access to a model, it says "The model does not exist")
        -- language = 'english', -- Such as 'japanese', 'french', 'pirate', 'LOLCAT'
        -- split_threshold = 100,
        -- additional_instruction = "Respond snarkily", -- (GPT-3 will probably deny this request, but GPT-4 complies)
        -- highlight = {
        --     icon = '', -- ''
        --     group = 'Comment',
        -- }
      })
    end,
  },
}
