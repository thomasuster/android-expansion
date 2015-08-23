import flash.display.BitmapData;
import nme.display.Bitmap;
import nme.display.Sprite;
import nme.Assets;
import nme.Lib;
import extension.androidExpansion.AndroidExpansion;
import extension.androidExpansion.ExpansionReader;
class Main extends Sprite {

    public function new () {
        super();
        addBitmapDataToStage(Assets.getBitmapData ("assets/nme.png"));
        handleExpansion();
    }

    function handleExpansion():Void {
        //Google Play -> Services & API -> Base64-encoded RSA public key
        AndroidExpansion.setKey('MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAul9VjbxKwReCzuLeVfNi1sCrsv/upIiSQsTS+5ToOiFD5tjEHNd4p/m95m4/8wf7aLgTjkhi7w8LTKwm+JVdFl5l4ZADY66Y+klysm95jrYhCHnbNjZIpQp6dKD94pVzo8Hf3d00vB0ZnyVhOZO8aMg9RrJtyzdioJgdMrpBq8yHXL8X/gvD00w/AkqHT+YUAXVn7FwuljMiDSAK15wO/uc/ec37yA4m8zMEK8K4skvzbA9cbAdBp+0PkxK+ep7zxNBtDtfCBJjlW4l1Fb3O7VA3i2abrxeWUnWZu3I51Rj/00h/cUXKz19TE8x/pDsUWUrRPqO5y98MsYctxX2drwIDAQAB');
        AndroidExpansion.setVersion(181);
        AndroidExpansion.setBytes(6342);
        //Modify this salt
        AndroidExpansion.setSalt([1, 42, -12, -1, 99, 98, -100, -12, 43, 2, -8, -4, 9, 5, -106, -107, -33, 45, -1, 84]);
        if(AndroidExpansion.expansionFilesDelivered()) {
            var expansionReader:ExpansionReader = new ExpansionReader();
            addBitmapDataToStage(expansionReader.getBitmapData('main-expansion/nme.png'));
        }
        else {
            AndroidExpansion.startDownloadServiceIfRequired();
        }
    }

    function addBitmapDataToStage(data:BitmapData):Void {
        var bitmap = new Bitmap (data);
        addChild (bitmap);
        bitmap.x = (Lib.current.stage.stageWidth - bitmap.width) / 2;
        bitmap.y = (Lib.current.stage.stageHeight - bitmap.height) / 2;
    }
}