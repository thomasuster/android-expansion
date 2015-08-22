import com.thomasuster.expansion.Command;
import com.thomasuster.expansion.ExpansionCommandFactory;
class TestTool extends haxe.unit.TestCase {

    var tool:ExpansionCommandFactory;
    var command:Command;

    override public function setup():Void {
        tool = new ExpansionCommandFactory();
    }

    public function testZip() {
        tool.args = [];
        tool.args.push('zip');
        tool.args.push('com.companany.project');
        tool.args.push('178');
        tool.args.push('main-expansion');
        tool.args.push('/Users/person/project/');
        command = tool.make();
        assertTrue(command.name == 'zip');
        assertTrue(command.cwd == '/Users/person/project/');
        assertTrue(command.args.length == 3);
        assertTrue(command.args[0] == '-r');
        assertTrue(command.args[1] == 'main.178.com.companany.project.obb');
        assertTrue(command.args[2] == 'main-expansion');
    }

    public function testPush() {
        tool.args = [];
        tool.args.push('push');
        tool.args.push('com.companany.project');
        tool.args.push('178');
        tool.args.push('/Users/person/project/');
        command = tool.make();
        assertTrue(command.name == 'adb');
        assertTrue(command.args.length == 3);
        assertTrue(command.args[0] == 'push');
        assertTrue(command.args[1] == '/Users/person/project/main.178.com.companany.project.obb');
        assertTrue(command.args[2] == '/mnt/shell/emulated/obb/com.companany.project/main.178.com.companany.project.obb');
    }

}