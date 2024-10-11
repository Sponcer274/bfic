function onCreatePost() --script made by impostor, credit me now or i will do an unfunny
    makeLuaText("message", "This is a certified hood classic", 500, 30, 90)
    setTextAlignment("message", "left")
    addLuaText("message")
     
    makeLuaText("engineText", "Ice Cream Engine | PE "..version.."", 500, 30, 70)
    setTextAlignment("engineText", "left")
    addLuaText("engineText")

    makeLuaText("version", "V.S. Ron | "..modversion.."", 500, 30, 50)
    setTextAlignment("version", "left")
    addLuaText("version")

    if getPropertyFromClass('ClientPrefs', 'downScroll') == false then
        setProperty('message.y', 700)
        setProperty('engineText.y', 680)
        setProperty('version.y', 660)
    end
end
