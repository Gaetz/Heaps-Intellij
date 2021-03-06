import hxd.Event;
import h2d.Tile;
import h2d.Font;
import h2d.Text;
import hxd.Res;

class HeapsApp extends hxd.App {

    public var haxeAlmostBlack = 0xFF141419; // FF for full alpha.
    public var haxeDarkRed     = 0xFFA84B38;
    public var haxeYellow      = 0xFFFBC707;
    public var haxeWhite       = 0xFFFFFFFF;
    public var haxeOrange      = 0xFFEA8220;

    var helloText : Text;
    var haxeLogo : h2d.Bitmap;
    var gravityFont : Font;

    override function init() {
        // Initialize all loaders for embedded resources (e.g. fonts, images)
        Res.initEmbed();

        // Create a background color.
        engine.backgroundColor = haxeAlmostBlack;

        // Load the font from resources.
        gravityFont = Res.gravityFont.toFont();

        // Create our text entry and place it in the middle of the bottom half of the screen.
        helloText = new Text(gravityFont, s2d);
        helloText.text = "Made with...";
        helloText.textColor = haxeOrange;

        // load the haxe logo png into a tile
        var tile : Tile = hxd.Res.hxlogo.toTile();
        tile = tile.center();

        haxeLogo = new h2d.Bitmap(tile, s2d);
        layout();

        s2d.addEventListener(onEvent);
    }

    private function layout() {
        helloText.x = (s2d.width * 0.5) - (helloText.textWidth * 0.5);
        helloText.y = (s2d.height * 0.2) - (helloText.textHeight * 0.5);

        haxeLogo.x = (s2d.width * 0.5);
        haxeLogo.y = (s2d.height * 0.5);
    }

    override function onResize() {
        layout();
    }

    private function onEvent(e : Event) : Void {
        if (e.kind == EventKind.EKeyUp || e.kind == EventKind.ERelease) {
            Sys.exit(0);
        }
    }
}

