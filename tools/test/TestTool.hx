import com.thomasuster.expansion.Command;
import com.thomasuster.expansion.MockSys;
import com.thomasuster.expansion.ExpansionTool;
class TestTool extends haxe.unit.TestCase {

    var tool:ExpansionTool;
    var mockSys:MockSys;
    var command:Command;

    override public function setup():Void {
        tool = new ExpansionTool();
        mockSys = new MockSys();
        tool.sysProxy = mockSys;
    }

    public function testZip() {
        setupZip();
        tool.handleArgs();
        command = mockSys.commands[0];
        assertTrue(command.name == 'zip');
        assertTrue(command.cwd == '/Users/person/project/');
        assertTrue(command.args.length == 3);
        assertTrue(command.args[0] == '-r');
        assertTrue(command.args[1] == 'main.178.com.companany.project.obb');
        assertTrue(command.args[2] == 'main-expansion');
    }

    public function testBytesShownForZip():Void {
        setupZip();
        tool.handleArgs();
        command = mockSys.commands[1];
        assertTrue(command.name == 'stat');
    }

    public function testPushForADB() {
        tool.args = [];
        tool.args.push('push');
        tool.args.push('com.companany.project');
        tool.args.push('178');
        tool.args.push('/Users/person/project/');
        tool.handleArgs();
        command = mockSys.commands[0];
        assertTrue(command.name == 'adb');
        assertTrue(command.args.length == 3);
        assertTrue(command.args[0] == 'push');
        assertTrue(command.args[1] == '/Users/person/project/main.178.com.companany.project.obb');
        assertTrue(command.args[2] == '/storage/emulated/0/Android/obb/com.companany.project/main.178.com.companany.project.obb');
    }

    function setupZip():Void {
        tool.args = [];
        tool.args.push('zip');
        tool.args.push('com.companany.project');
        tool.args.push('178');
        tool.args.push('main-expansion');
        tool.args.push('/Users/person/project/');
    }

}