package net.noiseinstitute.game.intro {
    import flash.media.Sound;
    import flash.media.SoundChannel;

    import net.flashpunk.FP;
    import net.flashpunk.World;
    import net.flashpunk.graphics.Image;
    import net.noiseinstitute.game.Main;

    public class IntroWorld extends World {
        [Embed(source="IntroMusic.mp3")]
        private static const MUSIC:Class;

        [Embed(source="Text1.png")]
        private static const TEXT1:Class;

        [Embed(source="Text2.png")]
        private static const TEXT2:Class;

        [Embed(source="Text3.png")]
        private static const TEXT3:Class;

        [Embed(source="Text4.png")]
        private static const TEXT4:Class;

        private var music:Sound = Sound(new MUSIC());
        private var musicChannel:SoundChannel;

        private var text1:Image = new Image(TEXT1);
        private var text2:Image = new Image(TEXT2);
        private var text3:Image = new Image(TEXT3);
        private var text4:Image = new Image(TEXT4);

        private var scroller1:Scroller = new Scroller(240, text1);
        private var scroller2:Scroller = new Scroller(320, text2);
        private var scroller3:Scroller = new Scroller(280, text3);
        private var scroller4:Scroller = new Scroller(360, text4);

        private var presidentOfSpace:PresidentOfSpace = new PresidentOfSpace();

        private var frame:int = 0;

        public function IntroWorld () {
            add(presidentOfSpace);
            add(scroller1);
            add(scroller2);
            add(scroller3);
            add(scroller4);
        }

        override public function begin():void {
            end();

            frame = 0;

            scroller1.start();
            scroller2.stop();
            scroller3.stop();
            scroller4.stop();

            musicChannel = music.play(0, int.MAX_VALUE);
        }

        override public function end():void {
            if (musicChannel != null) {
                musicChannel.stop();
                musicChannel = null;
            }
        }

        override public function update():void {
            if (frame >= 2 * Main.LOGIC_FPS && !scroller2.active) {
                scroller2.start();
            }

            if (frame >= 5 * Main.LOGIC_FPS && !scroller3.active) {
                scroller3.start();
            }

            if (frame >= 8 * Main.LOGIC_FPS && !scroller4.active) {
                scroller4.start();
            }

            if (frame >= 12 * Main.LOGIC_FPS) {
                Main.goToGame();
            }

            ++frame;

            super.update();
        }
    }
}
