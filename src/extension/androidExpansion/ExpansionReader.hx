package extension.androidExpansion;
import flash.utils.ByteArray;
import haxe.zip.Reader;
import sys.io.File;
import sys.io.FileInput;
import sys.FileSystem;
import flash.display.BitmapData;
class ExpansionReader {

    public function new():Void {}

    public function getBitmapData():BitmapData {
        var version:Int = 178;
        var localStoragePath : String = AndroidExpansion.getLocalStoragePath();
        trace(localStoragePath);
        var packageName : String = AndroidExpansion.getPackageName();
        trace(packageName);
        var assetsDirectory : String = localStoragePath + "/Android/obb/" + packageName + "/";
        trace(assetsDirectory);
        var assetsFilePath : String = assetsDirectory + "main." + version + "." + packageName + ".obb";


        trace(assetsFilePath);

        if(FileSystem.exists(assetsFilePath)) {
            var assetsFile : FileInput = File.read( assetsFilePath );
            var assetsEntries = Reader.readZip( assetsFile );

            var ignoreRootFolder = "";
            trace('Any entries?');
            for(entry in assetsEntries) {

                var fileName = entry.fileName;
                if (fileName.charAt (0) != "/" && fileName.charAt (0) != "\\" && fileName.split ("..").length <= 1) {
                    var dirs = ~/[\/\\]/g.split(fileName);
                    if ((ignoreRootFolder != "" && dirs.length > 1) || ignoreRootFolder == "") {
                        if (ignoreRootFolder != "") {
                            dirs.shift ();
                        }

                        var path = "";
                        var file = dirs.pop();
                        for( d in dirs ) {
                            path += d;
//                            sys.FileSystem.createDirectory(_dest + "/" + path);
                            path += "/";
                        }

                        if( file == "" ) {
                            if( path != "" ) trace("created " + path);
                            continue; // was just a directory
                        }
                        path += file;
                        trace("unzip " + path);
                        if(path == 'main-expansion/nme.png') {
                            var data = Reader.unzip(entry);
                            var byteArray:ByteArray = ByteArray.fromBytes(data);
                            return BitmapData.loadFromBytes(byteArray);
                        }
                    }
                }
            }
            trace('End of entries');
        }
        else
            trace('assetsFilePath ' + assetsFilePath + ' does not exist. $assetsFilePath');
        return null;
    }
}