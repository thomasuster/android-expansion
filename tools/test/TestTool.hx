import com.thomasuster.expansion.Command;
import com.thomasuster.expansion.ExpansionTool;
class TestTool extends haxe.unit.TestCase {

    var tool:ExpansionTool;
    var command:Command;

    override public function setup():Void {
        tool = new ExpansionTool();
    }

    public function testZipCase() {
        tool.args = [];
        tool.args.push('zip');
        tool.args.push('com.companany.project');
        tool.args.push('178');
        tool.args.push('main-expansion');
        tool.args.push('/Users/person/project/');
        command = tool.makeZip();
        assertTrue(command.name == 'zip');
        assertTrue(command.cwd == '/Users/person/project/');
        assertTrue(command.args.length == 3);
        assertTrue(command.args[0] == '-r');
        assertTrue(command.args[1] == 'main.178.com.companany.project.obb');
        assertTrue(command.args[2] == 'main-expansion');
    }

}