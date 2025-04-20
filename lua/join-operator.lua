-- Define the join operator function
local function join_operator(motion_type)
  if motion_type == "line" or motion_type == "char" or motion_type == "block" then
    vim.cmd "'[,']join"
  end
end

-- Make the function available globally so operatorfunc can see it
_G.join_operator = join_operator

-- Set up the J key as an operator
vim.keymap.set("n", "gJ", function()
  -- Set the operator function
  vim.o.operatorfunc = "v:lua.join_operator"
  -- Return g@ to wait for motion
  return "g@"
end, { expr = true })
