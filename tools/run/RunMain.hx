import com.thomasuster.expansion.Command;
import com.thomasuster.expansion.ExpansionCommandFactory;
import Array;
class RunMain
{
    static var commandFactory:ExpansionCommandFactory;
    static var command:Command;

    public static function main() {
        commandFactory = new ExpansionCommandFactory();
        commandFactory.args = Sys.args();
        command = commandFactory.make();
        if(command.cwd != null)
            Sys.setCwd(command.cwd);
        Sys.command(command.name, command.args);
    }
}