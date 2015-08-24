package com.thomasuster.expansion;
class ExpansionTool
{
    public var sysProxy:SysProxy;
    public var args:Array<String>;

    public function new():Void {
        sysProxy = new RealSys();
    }

    public function handleArgs():Void {
        if(args[0] == 'zip')
            makeZip();
        if(args[0] == 'push')
            makePush();
    }

    function makeZip():Void {
        var pack:String = getArg(0);
        var version:Int = Std.parseInt(getArg(1));
        var source:String = getArg(2);
        var dest:String = getLastArg();
        sysProxy.setCwd(dest);
        sysProxy.command('zip', ['-r', 'main.$version.$pack.obb', '$source']);
        sysProxy.command('stat', ['-f%z', 'main.$version.$pack.obb']);
    }

    function makePush():Void {
        var pack:String = getArg(0);
        var version:Int = Std.parseInt(getArg(1));
        var dest:String = getLastArg();
        var androidDestination:String = '/mnt/shell/emulated/obb';
        var name:String = 'main.$version.$pack.obb';
        sysProxy.command('adb',['push', '$dest$name', '$androidDestination/$pack/$name']);
    }

    public function getArg(i:Int):String {
        if(args.length > i) {
            return args[i+1];
        }
        return '';
    }

    public function getLastArg():String {
        return args[args.length-1];
    }

    public function log(s:String) {
        Sys.println(s);
    }
}