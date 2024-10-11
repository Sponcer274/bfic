function opponentNoteHit()
    health = getProperty('health')
    if dadName == 'ron' then
        if getProperty('health') > 0.005 then
            setProperty('health', health- 0.005);
        end
    elseif dadName == 'ron-mad' then
        if getProperty('health') > 0.01 then
            setProperty('health', health- 0.01);
        end
    elseif dadName == 'devilron' then
            setProperty('health', health- 0.015);
    elseif dadName == 'doyne' then
        if getProperty('health') > 0.005 then
            setProperty('health', health- 0.005);
        end
    end
end