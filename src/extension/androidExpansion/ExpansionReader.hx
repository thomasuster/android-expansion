package extension.androidExpansion;
import flash.utils.ByteArray;
import haxe.zip.Reader;
import sys.io.File;
import sys.io.FileInput;
import sys.FileSystem;
import flash.display.BitmapData;
class ExpansionReader {

    public var version:Int;

    var reg:EReg;

    public function new():Void {
        reg = ~/[\/\\]/g;
    }

    public function getBitmapData():BitmapData {
        var localStoragePath:String = AndroidExpansion.getLocalStoragePath();
        var packageName:String = AndroidExpansion.getPackageName();
        var assetsDirectory:String = localStoragePath + "/Android/obb/" + packageName + "/";
        var assetsFilePath:String = assetsDirectory + "main." + version + "." + packageName + ".obb";

        if(FileSystem.exists(assetsFilePath)) {
            var file:FileInput = File.read(assetsFilePath);
            var entries = Reader.readZip(file);
            for(entry in entries) {
                var fileName:String = entry.fileName;
                if (fileName.charAt (0) != "/" && fileName.charAt (0) != "\\" && fileName.split ("..").length <= 1) {
                    var dirs:Array<String> = reg.split(fileName);
                    var path:String = '';
                    var file = dirs.pop();
                    for( d in dirs ) {
                        path += d;
                        path += "/";
                    }
                    path += file;
                    if(path == 'main-expansion/nme.png') {
                        var data = Reader.unzip(entry);
                        var byteArray:ByteArray = ByteArray.fromBytes(data);
                        return BitmapData.loadFromBytes(byteArray);
                    }
                }
            }
        }
        return null;
    }
}