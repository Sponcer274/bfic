function onSongStart()
    function onUpdate()
        doTweenAngle('turn', 'camHUD', math.cos(curBeat) * 50, 3, 'linear')
        if curBeat >= 64.1 then
            doTweenAngle('turngame', 'camGame', math.cos(curBeat) * 50, 3, 'linear')
    end

    
    end
end