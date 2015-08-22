package extension.androidExpansion;

#if android
import openfl.utils.JNI;
#end

class AndroidExpansion {

    static var _init:Void->Void;
    static var _expansionFilesDelivered:Dynamic;
    static var _startDownloadServiceIfRequired:Dynamic;
    static var _getMainFile:Dynamic;
    static var _getPackageName:Dynamic;
    static var _getLocalStoragePath:Dynamic;
//    static var _overallTotal:Dynamic;

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

//    public static function overallTotal():String {
//        initJNI();
//        return _overallTotal();
//    }


//    public long mOverallTotal;
//public long mOverallProgress;
//public long mTimeRemaining; // time remaining
//public float mCurrentSpeed; // speed in KB/S

    private static function initJNI():Void {
        if(_init == null) {
            #if android
            _init = JNI.createStaticMethod("com/thomasuster/Expansion", "init", "()V");
            _expansionFilesDelivered = JNI.createStaticMethod("com/thomasuster/Expansion", "expansionFilesDelivered", "()I");
            _startDownloadServiceIfRequired = JNI.createStaticMethod("com/thomasuster/Expansion", "startDownloadServiceIfRequired", "()I");
            _getMainFile = JNI.createStaticMethod("com/thomasuster/Expansion", "getMainFile", "()Ljava/lang/String;");

            _getPackageName = JNI.createStaticMethod("com/thomasuster/Expansion", "getPackageName", "()Ljava/lang/String;");
            _getLocalStoragePath = JNI.createStaticMethod("com/thomasuster/Expansion", "getLocalStoragePath", "()Ljava/lang/String;");

//            _overallTotal = JNI.createStaticMethod("com/thomasuster/Expansion", "overallTotal", "()Ljava.lang.Long");

            #end
        }
    }
}