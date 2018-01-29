package migrate.server.mysql;

import java.io.File;

import org.javalite.activejdbc.DB;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.typesafe.config.Config;
import com.typesafe.config.ConfigFactory;

public class MysqlDatabase {
	private static final Logger LOGGER = LoggerFactory.getLogger(MysqlDatabase.class);

	private static String driver;
	private static String url;
	private static String user;
	private static String password;
	private static String connectionName;

	private static DB db;

	static {
		// 加载配置文件
		File file = new File("config/application.conf");
		Config root = ConfigFactory.parseFile(file);
		Config config = root.getConfig("config.mysql");

		driver = config.getString("driver");
		url = config.getString("url");
		user = config.getString("user");
		password = config.getString("password");
		connectionName = config.getString("connectionName");

	}

	public static boolean openDatabase() {
		try {
			getDb().open(driver, url, user, password);
			return true;
		} catch (Exception e) {
			LOGGER.error(e.getMessage(), e);
		}
		return false;
	}

	public static boolean closeDatabase() {
		try {
			if (getDb().hasConnection()) {
				getDb().close();
			}
			return true;
		} catch (Exception e) {
			LOGGER.error(e.getMessage(), e);
		}
		return false;
	}

	public static DB getDb() {
		if (db == null) {
			db = new DB(connectionName);
		}
		return db;
	}

}
