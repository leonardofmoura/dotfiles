local starting_words = nil

-- Start writing session
local function  start_writing_session()
  -- session already started: 
  if starting_words ~= nil then 
    vim.notify("Session already started", vim.log.levels.INFO)
    return
  end


  starting_words = vim.fn.wordcount().words
  vim.notify("Writing Session Started", vim.log.levels.INFO)
end


local function terminate_writing_session()
  if starting_words == nil then
    vim.notify("Writing Session already active", vim.log.levels.INFO)
    return
  end
  
  local final_words = vim.fn.wordcount().words
  local total = final_words - starting_words

  starting_words = nil

  vim.notify("Writing Session ended. Words Written: " .. (total), vim.log.levels.INFO)
end


function GetSessionProgress()
  if starting_words == nil  then
    return "No Writing Session active"
  end

  return "Words Written: " .. (vim.fn.wordcount().words - starting_words)
end


local function session_progress() 
  vim.notify(GetSessionProgress(), vim.log.levels.INFO)
end


-- Define commands
vim.api.nvim_create_user_command('WritingStart', start_writing_session, {})
vim.api.nvim_create_user_command('WritingStop', terminate_writing_session, {})
vim.api.nvim_create_user_command('WritingProgress', session_progress, {})

