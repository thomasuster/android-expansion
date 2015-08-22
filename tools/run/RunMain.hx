import com.thomasuster.expansion.ExpansionTool;
import Array;
class RunMain
{
    static var tool:ExpansionTool;

    public static function main() {
        tool = new ExpansionTool();
        tool.args = Sys.args();
        tool.handleArgs();
    }
}