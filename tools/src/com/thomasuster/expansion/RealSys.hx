package com.thomasuster.expansion;
class RealSys extends SysProxy
{

    override public function setCwd(s:String):Void {
        Sys.setCwd(s);
    }

    override public function command( cmd : String, ?args : Array<String> ) : Int {
        return Sys.command(cmd, args);
    }
}