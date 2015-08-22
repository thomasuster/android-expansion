package com.thomasuster.expansion;
class MockSys extends SysProxy
{
    public var commands:Array<Command>;

    var cwd:String;

    public function new():Void {
        super();
        commands = [];
    }

    override public function setCwd(s:String):Void {
        cwd = s;
    }

    override public function command( cmd : String, ?args : Array<String> ) : Int {
        var command:Command = new Command();
        command.name = cmd;
        command.args = args;
        command.cwd = cwd;
        commands.push(command);
        return 0;
    }
}