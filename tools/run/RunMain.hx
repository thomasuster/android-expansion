import Array;
class RunMain
{

    public static function main() {
        log('haxe-android-expansion-util');
        trace(Sys.args());
        var command:String = Sys.args()[0];
        log('command = $command');
        if(command == 'zip')
            zip();
        if(command == 'push')
            push();
    }

    static function zip() {
        var pack:String = getArg(0);
        var version:Int = Std.parseInt(getArg(1));
        var source:String = getArg(2);
        var dest:String = getLastArg();
        log('pack = $pack');
        log('version = $version');
        log('source = $source');
//        dest = dest.substr(Sys.getCwd().length);
        log('dest = $dest');

//        log(Sys.getCwd());
        Sys.setCwd(dest);
        var requiredArgs:Array<String> = ['-r', 'main.$version.$pack.obb', '$source'];
        trace(requiredArgs);
        Sys.command('zip', requiredArgs);
    }

    static function push() {
        var pack:String = getArg(0);
        var version:Int = Std.parseInt(getArg(1));
        var dest:String = getLastArg();
        //adb push main.200.io.nme.samples.displayingabitmap.obb /mnt/shell/emulated/obb/io.nme.samples.displayingabitmap
        //mnt/sdcard/Android/obb/
        ///mnt/shell/emulated/obb
    ///storage/emulated/0/Android/obb/
        var androidDestination:String = '/mnt/shell/emulated/obb';
        var name:String = 'main.$version.$pack.obb';
        var requiredArgs:Array<String> = ['push', '$dest$name', '$androidDestination/$pack/$name'];
        trace(requiredArgs);
        trace(Sys.getCwd());
        Sys.command('adb', requiredArgs);
    }

    public static function getArg(i:Int):String {
        if(Sys.args().length > i) {
            return Sys.args()[i+1];
        }
        return '';
    }

    public static function getLastArg():String {
        return Sys.args()[Sys.args().length-1];
    }

    public static function log(s:String) {
        Sys.println(s);
    }


}