function isInt (i)
    if (i == math.floor(i)) then
       return true
    end
    return false
end

return { 
    isInt = isInt
}