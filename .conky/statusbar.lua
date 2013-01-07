do
   local default_color = "\\#ffffff"
   local ok_color = "\\#00ff00"
   local warning_color = "\\#FF9900"
   local critical_color = "\\#ff0000"
   local muted_color = "\\#555555"

   -- Print anything - including nested tables
   function table_print (tt, indent, done)
      done = done or {}
      indent = indent or 0
      if type(tt) == "table" then
         for key, value in pairs (tt) do
            io.write(string.rep (" ", indent)) -- indent it
            if type (value) == "table" and not done [value] then
               done [value] = true
               io.write(string.format("[%s] => table\n", tostring (key)));
               io.write(string.rep (" ", indent+4)) -- indent it
               io.write("(\n");
               table_print (value, indent + 7, done)
               io.write(string.rep (" ", indent+4)) -- indent it
               io.write(")\n");
            else
               io.write(string.format("[%s] => %s\n",
                                      tostring (key), tostring(value)))
            end
         end
      else
         io.write(tt .. "\n")
      end
   end

   function split(str, pat)
      local t = {}  -- NOTE: use {n = 0} in Lua-5.0
      local fpat = "(.-)" .. pat
      local last_end = 1
      local s, e, cap = str:find(fpat, 1)
      while s do
         if s ~= 1 or cap ~= "" then
            table.insert(t,cap)
         end
         last_end = e+1
         s, e, cap = str:find(fpat, last_end)
      end
      if last_end <= #str then
         cap = str:sub(last_end)
         table.insert(t, cap)
      end
      return t
   end

   function conky_format( format, number )
      if type(number) ~= "number" then
         number = tonumber(conky_parse(number)) or 0.0
      end
      return string.format( format, conky_parse( number ) )
   end

   function conky_statusbar_bat(bat)
      local short = split(conky_parse("${battery_short BAT1}"), " ")
      local bat_short = short[1]
      local percents = short[2] or "100"
      local text = ""

      if bat_short == "N" or bat_short == "U" or bat_short == "E" then
         return "{ \"full_text\":\" No BAT \", \"color\":\""..muted_color.."\" }"
      else
         percents = percents:gsub("%%", "")
         percents = tonumber(percents)
         local clr = ok_color
         local bat_time = ""

         if percents <= 20 then
            clr = critical_color
         elseif percents <= 70 then
            clr = warning_color
         elseif percents <= 100 then
            clr = ok_color
         end

         if bat_short == "D" or bat_short == "C" then
            bat_time = " ${battery_time BAT1}"
         else
            clr = muted_color
         end

         return "{ \"full_text\":\" BAT: "..percents.."\% "..bat_short..bat_time.." \", \"color\":\""..clr.."\"}"
      end
   end

   function conky_statusbar_cpu()
      local percents = tonumber(conky_parse("$cpu")) or 0
      local clr = default_color

      local tempstr = conky_parse("${exec sensors | grep \"Core 0\"|awk '{print $3}'}")
      _, _, temp = string.find(tempstr, "([%+%-0-9.]+)")
      temp = tonumber(temp)

      if percents >= 80 or temp >= 80 then
         clr = warning_color
      elseif percents >= 90 or temp >= 90 then
         clr = critical_color
      end

      return "{ \"full_text\":\" CPU: ${lua_parse format %2.0f ${cpu} }%  "..tempstr.."  ${lua_parse format %1.2f ${loadavg 1}} LA \", \"color\":\""..clr.."\"}"
   end

   function conky_statusbar_topproc()
      local cpu_percents = tonumber(conky_parse("$cpu")) or 0
      local clr = muted_color

      if cpu_percents >= 80 then
         clr = warning_color
      elseif cpu_percents >= 90 then
         clr = critical_color
      end

      return "{ \"full_text\":\" ${top name 1} (${top pid 1}) ${top user 1} ${top cpu 1} ${top mem_res 1} \", \"color\":\""..clr.."\"}"
   end

   function conky_statusbar_keyb()
      local clr = "\\#ffffff"

      return "{ \"full_text\":\" ${exec skb 1} \", \"color\":\""..clr.."\"}"
   end

   function conky_statusbar_mem()
      local percents = tonumber(conky_parse("${memperc}")) or 0
      local clr = default_color

      if percents >= 80 then
         clr = critical_color
      elseif percents >= 60 then
         clr = warning_color
      end

      return "{ \"full_text\":\" MEM: "..percents.."\% Used (${mem}/${memmax}) \", \"color\":\""..clr.."\"}"
   end

end