package com.thomasuster.expansion;

class ExpansionCommandFactory
{
    public var args:Array<String>;

    var command:Command;

    public function new():Void {}

    public function make():Command {
        command = new Command();
        if(args[0] == 'zip')
            makeZip();
        if(args[0] == 'push')
            makePush();
        return command;
    }

    function makeZip():Void {
        command.name = args[0];
        var pack:String = getArg(0);
        var version:Int = Std.parseInt(getArg(1));
        var source:String = getArg(2);
        var dest:String = getLastArg();
        command.cwd = dest;
        command.args = ['-r', 'main.$version.$pack.obb', '$source'];
    }

    function makePush():Void {
        command.name = 'adb';
        var pack:String = getArg(0);
        var version:Int = Std.parseInt(getArg(1));
        var dest:String = getLastArg();
        var androidDestination:String = '/mnt/shell/emulated/obb';
        var name:String = 'main.$version.$pack.obb';
        command.args = ['push', '$dest$name', '$androidDestination/$pack/$name'];
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