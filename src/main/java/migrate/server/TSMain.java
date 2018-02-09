package migrate.server;

import java.io.Console;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import migrate.server.handle.Handler;
import migrate.server.handle.cdlx.CDLXhandlerForTS;
import migrate.server.mysql.MysqlDatabase;
import migrate.server.sqlserver.SqlServerDatabase;

public class TSMain {
	private static final Logger LOGGER = LoggerFactory.getLogger(TSMain.class);

	public static void main(String[] args) {

		SqlServerDatabase.openDatabase();
		MysqlDatabase.openDatabase();

		Handler handler = new CDLXhandlerForTS();
		handler.handle();
		handler.showNotFoundDic();
		handler.getRollbackSql();

		SqlServerDatabase.closeDatabase();
		MysqlDatabase.closeDatabase();

		Console cs = System.console();

		if (cs == null) {
			return;
		}
		System.out.println("\n\n按任意键退出....");

		while (cs.readLine() != null) {
			System.exit(0);
		}
	}
}
