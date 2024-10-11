local defaultNotePos = {};
local spin = true;


function onSongStart()
    for i = 0,7 do
        x = getPropertyFromGroup('strumLineNotes', i, 'x')

        y = getPropertyFromGroup('strumLineNotes', i, 'y')

        table.insert(defaultNotePos, {x,y})
      --  debugPrint("{" .. x .. "," .. y .. "}" .. " i:".. i)
    end
end

function onUpdate(elapsed)
    songPos = getPropertyFromClass('Conductor',  'songPosition');

    currentBeat = (songPos / 1000) * (bpm / 60)

    if  spin == true then
        for i = 0,7 do

            setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2] + 50 * math.cos((currentBeat + i*0.25) * math.pi))
        end
    end
end

defaultWindowPos = {256,256};
Windowspeed = 0.69;
WinmovementAmount = 40;

function onUpdatePost(elapsed)
    if not inGameOver then 
        windowLoop(elapsed);
        collisionLoop(elapsed);
    end
end

function windowLoop(elapsed)
    if curStep >= 256 then
        if curStep <= 512 then
            setPropertyFromClass("openfl.Lib", "application.window.x", defaultWindowPos[1] + WinmovementAmount * math.sin(((getSongPosition() / 1000)*(bpm/60) * Windowspeed) * math.pi))
            setPropertyFromClass("openfl.Lib", "application.window.y", defaultWindowPos[2] + WinmovementAmount * math.cos(((getSongPosition() / 1000)*(bpm/60) * Windowspeed) * math.pi))
            setPropertyFromClass("flixel.FlxG", "fullscreen", false)
            setPropertyFromClass("openfl.Lib", "application.window.title", genWinName(20))
    end


end
end
