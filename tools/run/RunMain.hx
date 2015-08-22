import com.thomasuster.expansion.Command;
import com.thomasuster.expansion.ExpansionTool;
import Array;
class RunMain
{
    static var commandFactory:ExpansionTool;
    static var command:Command;

    public static function main() {
        commandFactory = new ExpansionTool();
        commandFactory.args = Sys.args();
        command = commandFactory.handleArgs();
        if(command.cwd != null)
            Sys.setCwd(command.cwd);
        Sys.command(command.name, command.args);
//        if(Sys.args[0] == 'zip') {
//            Sys.command('stat', ['-f%z', ]);
//        }
    }
}