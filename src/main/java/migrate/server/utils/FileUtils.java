package migrate.server.utils;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class FileUtils {
	private static final Logger LOGGER = LoggerFactory.getLogger(FileUtils.class);
	
	public static boolean writeFile(String fileName, String content) {

		if (!ensureFileExist(new File(fileName))) {
			return false;
		}

		try {

			FileOutputStream fos = new FileOutputStream(fileName);
			fos.write(content.getBytes());
			fos.close();
		} catch (IOException e) {
			LOGGER.error(e.getMessage(), e);
			return false;
		}
		return true;

	}
	
	private static boolean ensureFileExist(File file) {
		file.delete();
		try {

			if (file.getParent() != null && !new File(file.getParent()).exists()) {
				new File(file.getParent()).mkdirs();
			}

			file.createNewFile();
		} catch (IOException e) {
			LOGGER.error(e.getMessage(), e);
			return false;
		}
		return true;
	}

}
