package com.thomasuster.expansion;

class ExpansionTool
{
    public var args:Array<String>;

    public function new():Void {}

    public function makeZip():Command {
        var command:Command = new Command();
        command.name = args[0];
        var pack:String = getArg(0);
        var version:Int = Std.parseInt(getArg(1));
        var source:String = getArg(2);
        var dest:String = getLastArg();
        command.cwd = dest;
        command.args = ['-r', 'main.$version.$pack.obb', '$source'];
        return command;
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