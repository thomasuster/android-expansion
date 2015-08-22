import Array;
class RunMain
{
    public static function main() {
        log('haxe-android-expansion-util');
        trace(Sys.args()[0]);
        trace(Sys.args()[1]);
        var command:String = Sys.args()[0];
        log('command = $command');
        if(command == 'zip')
            zip();
    }

    static function zip() {
        var pack:String = getArg(0);
        var version:Int = Std.parseInt(getArg(1));
        var source:String = getArg(2);
        var dest:String = getArg(3);
        log('pack = $pack');
        log('version = $version');
        log('source = $source');
//        dest = dest.substr(Sys.getCwd().length);
        log('dest = $dest');

        log(Sys.getCwd());
        var requiredArgs:Array<String> = ['-r', '$dest$pack.$version.obb', '$dest$source'];
        trace(requiredArgs);
        Sys.command('zip', requiredArgs);
    }

    public static function getArg(i:Int):String {
        if(Sys.args().length > i+2) {
            return Sys.args()[i+2];
        }
        return '';
    }

    public static function log(s:String) {
        Sys.println(s);
    }
//
//    if(arg == 'unzip') {
//var fileContent = File.getContent('../client/shared.nmml');
//var versionParser:VersionParser = injector.instantiate(VersionParser);
//var version:Int = versionParser.parse(fileContent);
//var requiredArgs:Array<String> = ['../client/Export/main.proto.games.$version.obb', '-d', '../client/assets/expansion-main'];
//Sys.command('unzip', requiredArgs);
//}
}