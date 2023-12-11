return {
  merge_tables = function(...)
    local t3 = {}
    for i, table in ipairs({ ... }) do
      for k, v in pairs(table) do
        t3[k] = v
      end
    end
    return t3
  end
}
