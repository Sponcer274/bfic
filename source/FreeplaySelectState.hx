package;

#if desktop
import Discord.DiscordClient;
#end
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.FlxSprite;
import flixel.FlxG;

class FreeplaySelectState extends MusicBeatState{
	public static var freeplay2:Bool;
	public static var freeplay3:Bool;
    var freeplayCats:Array<String> = ['Main', 'Douyhe', 'Extras'];
	var grpCats:FlxTypedGroup<Alphabet>;
	var curSelected:Int = 0;
	var bg:FlxSprite;
    override function create(){
		#if desktop
		// Updating Discord Rich Presence
		DiscordClient.changePresence("Selecting a Freeplay Category", null);
		#end

        bg = new FlxSprite().loadGraphic(Paths.image('menuDesat'));
		bg.updateHitbox();
		bg.screenCenter();
		add(bg);
        grpCats = new FlxTypedGroup<Alphabet>();
		add(grpCats);
        for (i in 0...freeplayCats.length)
        {
			var catsText:Alphabet = new Alphabet(0, (70 * i) + 30, freeplayCats[i], true, false);
            catsText.targetY = i;
            catsText.isMenuItem = true;
			grpCats.add(catsText);
		}
        changeSelection();
        super.create();
    }

    override public function update(elapsed:Float){
        
		if (controls.UI_UP_P) 
			changeSelection(-1);
		if (controls.UI_DOWN_P) 
			changeSelection(1);
		if (controls.BACK) {
			FlxG.sound.play(Paths.sound('cancelMenu'));
			MusicBeatState.switchState(new MainMenuState());
		}
        if (controls.ACCEPT){
            switch(curSelected)
			{
                case 0:
                MusicBeatState.switchState(new FreeplayState());
                case 1:
                MusicBeatState.switchState(new FreeplayCategory2State());
				case 2:
				MusicBeatState.switchState(new FreeplayCategory3State());
            }
        }
        super.update(elapsed);
    }

    function changeSelection(change:Int = 0) {
		curSelected += change;
		if (curSelected < 0)
			curSelected = freeplayCats.length - 1;
		if (curSelected >= freeplayCats.length)
			curSelected = 0;

		var bullShit:Int = 0;

		for (item in grpCats.members) {
			item.targetY = bullShit - curSelected;
			bullShit++;

			item.alpha = 0.6;
			if (item.targetY == 0) {
				item.alpha = 1;
			}
		}
		FlxG.sound.play(Paths.sound('scrollMenu'));
	}
}