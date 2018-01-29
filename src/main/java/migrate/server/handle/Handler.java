package migrate.server.handle;

public interface Handler {

	void handle();

	void showNotFoundDic();

	void getRollbackSql();

}
