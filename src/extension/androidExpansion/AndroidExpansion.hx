package extension.androidExpansion;

#if android
import openfl.utils.JNI;
#end

class AndroidExpansion {

    public static var version:Int;

    static var _init:Void->Void;
    static var _expansionFilesDelivered:Dynamic;
    static var _startDownloadServiceIfRequired:Dynamic;
    static var _getMainFile:Dynamic;
    static var _getPackageName:Dynamic;
    static var _getLocalStoragePath:Dynamic;
    static var _setVersion:Dynamic;
    static var _setBytes:Dynamic;
    static var _setKey:Dynamic;
    static var _setSalt:Dynamic;

    public static function init():Void {
        initJNI();
        _init();
    }

    public static function setVersion(v:Int):Void {
        initJNI();
        version = v;
        _setVersion(v);
    }

    public static function setBytes(v:Float):Void {
        initJNI();
        _setBytes(v);
    }

    public static function setKey(v:String):Void {
        initJNI();
        _setKey(v);
    }

    public static function setSalt(v:Array<Int>):Void {
        initJNI();
        _setSalt(v);
    }

    public static function expansionFilesDelivered():Bool {
        initJNI();
        if(_expansionFilesDelivered() == 1)
            return true;
        return false;
    }

    public static function startDownloadServiceIfRequired():Int {
        initJNI();
        return _startDownloadServiceIfRequired();
    }

    public static function getMainFile():String {
        initJNI();
        return _getMainFile()[0];
    }

    public static function getPackageName():String {
        initJNI();
        return _getPackageName();
    }

    public static function getLocalStoragePath():String {
        initJNI();
        return _getLocalStoragePath();
    }

    private static function initJNI():Void {
        if(_init == null) {
            #if android
            _init = JNI.createStaticMethod("com/thomasuster/Expansion", "init", "()V");
            _expansionFilesDelivered = JNI.createStaticMethod("com/thomasuster/Expansion", "expansionFilesDelivered", "()I");
            _startDownloadServiceIfRequired = JNI.createStaticMethod("com/thomasuster/Expansion", "startDownloadServiceIfRequired", "()I");
            _getMainFile = JNI.createStaticMethod("com/thomasuster/Expansion", "getMainFile", "()Ljava/lang/String;");

            _getPackageName = JNI.createStaticMethod("com/thomasuster/Expansion", "getPackageName", "()Ljava/lang/String;");
            _getLocalStoragePath = JNI.createStaticMethod("com/thomasuster/Expansion", "getLocalStoragePath", "()Ljava/lang/String;");

            _setVersion = JNI.createStaticMethod("com/thomasuster/Expansion", "setVersion", "(I)V");
            _setBytes = JNI.createStaticMethod("com/thomasuster/Expansion", "setBytes", "(J)V");
            _setKey = JNI.createStaticMethod("com/thomasuster/Expansion", "setKey", "(Ljava/lang/String;)V");
            _setSalt = JNI.createStaticMethod("com/thomasuster/Expansion", "setSalt", "([B)V");
            #end
        }
    }
}