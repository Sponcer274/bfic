function onCreate()
	-- background shit
	makeLuaSprite('roadandbuildings', 'crackedroad', -620, -220);
	setScrollFactor('roadandbuildings', 1, 1);

	addLuaSprite('roadandbuildings', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end