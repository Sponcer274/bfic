function onCreate()
	-- background shit
	makeLuaSprite('roadandbuildings', 'roadmurky', -620, -220);
	setScrollFactor('roadandbuildings', 1, 1);

	makeLuaSprite('cameos', 'cameos', -570, 20);
	setScrollFactor('cameos', 1, 1);
	scaleObject('cameos', 0.7, 0.7);

	addLuaSprite('roadandbuildings', false);
	addLuaSprite('cameos', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end