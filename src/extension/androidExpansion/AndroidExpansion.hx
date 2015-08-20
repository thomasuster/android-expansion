package extension.androidExpansion;

#if android
import openfl.utils.JNI;
#end

class AndroidExpansion {

    private static var _init:Void->Void;

    public static function init():Void {
        initJNI();
        _init();
    }

    private static function initJNI():Void {
        if(_init == null) {
            #if android
            _init = JNI.createStaticMethod("com/thomasuster/Expansion", "init", "()V");
            #end
        }
    }
}