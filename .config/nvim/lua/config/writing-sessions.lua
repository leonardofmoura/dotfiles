local starting_words = nil
local starting_time = nil
local session_started = false



local function format_time(seconds)
  local hours = math.floor(seconds / 3600)
  local mins = math.floor((seconds % 3600) / 60)
  local secs = seconds % 60

  local time_str = string.format("%02d:%02d:%02d", hours, mins, secs)

  return time_str
end


local function calculate_wph(total_words, seconds)
  local wph = 0

  if seconds > 0 then
    wph = math.floor((total_words / seconds) * 3600)
  end
  
  return wph
end


local function get_session_state()
  local current_words = vim.fn.wordcount().words
  local current_time = os.time()

  local total_words = current_words - starting_words
  local total_time = current_time - starting_time

  return total_words, total_time
end


local function  start_writing_session()
  if session_started then
    vim.notify("Session already started", vim.log.levels.INFO)
    return
  end

  starting_words = vim.fn.wordcount().words
  starting_time = os.time()
  session_started = true

  vim.notify("Writing Session Started", vim.log.levels.INFO)
end


local function terminate_writing_session()
  if  not session_started then
    vim.notify("No Writing Session active", vim.log.levels.INFO)
    return
  end
  
  local total_words, total_time = get_session_state()

  local duration = format_time(total_time)
  local wph = calculate_wph(total_words,total_time)

  local session_info = string.format("󰴓 %d | 󰥔  %s |   %d", total_words, duration, wph)


  -- reset session state
  starting_words = nil
  starting_time = nil
  session_started = false

  vim.notify("Writing Session ended. Session info: " .. (session_info), vim.log.levels.INFO)
end



-- function used for lualine
function GetSessionProgress()
  if not session_started  then
    return "No Writing Session active"
  end
  
  local total_words, total_time = get_session_state()
  local duration = format_time(total_time)

  return string.format("󰴓 %d | 󰥔  %s", total_words, duration)
end


-- function called in the command
local function session_progress()
  if not session_started  then
    return "No Writing Session active"
  end

  local total_words, total_time = get_session_state()

  local duration = format_time(total_time)
  local wph = calculate_wph(total_words,total_time)

  local progress = string.format("󰴓 %d | 󰥔  %s |   %d", total_words, duration, wph)

  vim.notify(progress, vim.log.levels.INFO)
end


-- Define commands
vim.api.nvim_create_user_command('WritingStart', start_writing_session, {})
vim.api.nvim_create_user_command('WritingStop', terminate_writing_session, {})
vim.api.nvim_create_user_command('WritingProgress', session_progress, {})

