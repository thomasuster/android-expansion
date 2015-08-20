package extension.androidExpansion;

#if android
import openfl.utils.JNI;
#end

class AndroidExpansion {

    static var _init:Void->Void;
    static var _expansionFilesDelivered:Dynamic;

    public static function init():Void {
        initJNI();
        _init();
    }

    public static function expansionFilesDelivered():Bool {
        initJNI();
        if(_expansionFilesDelivered() == 1)
            return true;
        return false;
    }

    private static function initJNI():Void {
        if(_init == null) {
            #if android
            _init = JNI.createStaticMethod("com/thomasuster/Expansion", "init", "()V");
            _expansionFilesDelivered = JNI.createStaticMethod("com/thomasuster/Expansion", "expansionFilesDelivered", "()I");
            #end
        }
    }
}