package migrate.server.handle.cdlx;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.typesafe.config.Config;
import com.typesafe.config.ConfigFactory;

import migrate.server.handle.Handler;
import migrate.server.mysql.MysqlDatabase;
import migrate.server.sqlserver.SqlServerDatabase;
import migrate.server.utils.FileUtils;
import migrate.server.utils.Objects;
import migrate.server.utils.SqlGenerateUtils;

/**
 * 成都理想的迁移逻辑
 * 
 * @author teclan
 * 
 *         email: tbj621@163.com
 *
 *         2018年1月24日
 */
public class CDLXhandler implements Handler {
	private static final Logger LOGGER = LoggerFactory.getLogger(CDLXhandler.class);
	private final static SimpleDateFormat DATE_FORMAT_TO_DAY = new SimpleDateFormat("yyyy-MM-dd");

	// 指定每页大小为 1000
	private final static int LIMIT = 1000;

	// 默认创建时间
	private final static String CREATE_DATE = DATE_FORMAT_TO_DAY.format(new Date());

	private final static String INSERT_SQL = "insert into %s %s";

	private static Set<String> businessNotFound = new HashSet<String>();
	private static Set<String> snModelNotFound = new HashSet<String>();
	private static Set<String> devModelNotFound = new HashSet<String>();

	private static Set<String> devIds = new HashSet<String>();
	private static Set<String> userIds = new HashSet<String>();

	private static Map<String, String> businessMap = new HashMap<String, String>();

	private static int NVRGBID = 1000;
	private static int CAMERAGBID = 1000;
	private static int CAMERA_DEV_ID = 10000;
	private static int USER_EVENT_ID = 100000;

	// NVR设备类型
	private static String DEV_MODEL_ID;
	// 平台ID
	private static String PLATFORM_ID;
	// 流转服务
	private static String VEDIO_SERVER;
	// 默认区域ID
	private static String AREAID;

	static {

		File file = new File("config/application.conf");
		Config root = ConfigFactory.parseFile(file);
		Config config = root.getConfig("config");

		DEV_MODEL_ID = config.getString("devModelId");
		PLATFORM_ID = config.getString("platformId");
		VEDIO_SERVER = config.getString("videoServer");
		AREAID = config.getString("areaId");

		// 用户行业映射
		businessMap.put("宾馆", "宾馆、饭店	");
		businessMap.put("化工", "企业");
		businessMap.put("库房", "企业");
		businessMap.put("医疗卫生", "卫生");
		businessMap.put("机关事业单位", "事业、机关");
		businessMap.put("招待所", "宾馆、饭店");
		businessMap.put("餐饮", "餐饮、娱乐	");
		businessMap.put("店铺", "门市");
		businessMap.put("古玩", "个人");
		businessMap.put("中学", "学校");
		businessMap.put("社区服务", "企业");
		businessMap.put("酒店", "宾馆、饭店	");
		businessMap.put("服装", "个人");
		businessMap.put("黄金珠宝", "个人");
		businessMap.put("饭店", "餐饮、娱乐	");
		businessMap.put("社会企业", "企业");
		businessMap.put("烟酒", "烟草");
		businessMap.put("烟酒店", "烟草");
		businessMap.put("餐馆", "餐饮、娱乐");
		businessMap.put("加气站", "公司");
		businessMap.put("老年公寓", "宾馆、饭店	");
		businessMap.put("诊所", "卫生");
		businessMap.put("网店", "个人");
		businessMap.put("典当行", "个人");
		businessMap.put("旅馆", "宾馆、饭店	");
		businessMap.put("店铺医药", "药店");
		businessMap.put("休闲娱乐", "餐饮、娱乐	");
		businessMap.put("养鸡场", "个人");
		businessMap.put("娱乐", "餐饮、娱乐	");
		businessMap.put("个人家庭", "个人");
		businessMap.put("旅店", "宾馆、饭店	");

	}

	public void handle() {
		handleUserInfo();
		handleAlarmHostOrOneClickDev();
	}

	public void showNotFoundDic() {

		LOGGER.info("\n缺失的用户行业字典:");
		for (String business : businessNotFound) {
			LOGGER.info("{}", business);
		}

		LOGGER.info("\n缺失的探头型号字典:");
		for (String snModel : snModelNotFound) {
			LOGGER.info("{}", snModel);
		}

		LOGGER.info("\n缺失的设备类型字典:");
		for (String devModel : devModelNotFound) {
			LOGGER.info("{}", devModel);
		}

	}

	public void getRollbackSql() {

		String sql = "delete from %s where %s in ('%s') ;\r\n";

		StringBuilder sb = new StringBuilder();
		sb.append(String.format(sql, "imm_userinfo", "userId", Objects.Joiner("','", userIds)));
		sb.append(String.format(sql, "imm_customerattr", "userId", Objects.Joiner("','", userIds)));
		sb.append(String.format(sql, "imm_usercont", "userId", Objects.Joiner("','", userIds)));
		sb.append(String.format(sql, "imm_ownerzone", "ownerId", Objects.Joiner("','", userIds)));
		sb.append(String.format(sql, "imm_ownermonitor", "ownerId", Objects.Joiner("','", userIds)));
		sb.append(String.format(sql, "imm_ownerevtrecord", "ownerId", Objects.Joiner("','", userIds)));

		sb.append(String.format(sql, "imm_devinfo", "devId", Objects.Joiner("','", devIds)));
		sb.append(String.format(sql, "imm_alarmhostattr", "devId", Objects.Joiner("','", devIds)));
		sb.append(String.format(sql, "imm_devzone", "devId", Objects.Joiner("','", devIds)));
		sb.append(String.format(sql, "imm_netnvrattr", "devId", Objects.Joiner("','", devIds)));
		sb.append(String.format(sql, "imm_camera", "devId", Objects.Joiner("','", devIds)));
		sb.append(String.format(sql, "imm_one_click_dev_attr", "devId", Objects.Joiner("','", devIds)));

		FileUtils.writeFile("回滚脚本.sql", sb.toString());

		LOGGER.info("回滚脚本生成完成,参见文件 `回滚脚本.sql` ...");
	}

	private String getNextCameraDevId() {
		return "2018" + CAMERA_DEV_ID++;
	}

	/**
	 * 00000A用户，有4个通道：
	 * 
	 * NVR：13010200001180001000
	 * 
	 * 通道1：13010200001310001000
	 * 
	 * 通道2：13010200001310001002
	 * 
	 * 通道3：13010200001310001003
	 * 
	 * 通道4：13010200001310001004
	 * 
	 * 00000B用户，有4个通道：
	 * 
	 * NVR：13010200001180001001
	 * 
	 * 通道1：13010200001310001005
	 * 
	 * 通道2：13010200001310001006
	 * 
	 * 通道3：13010200001310001007
	 * 
	 * 通道4：13010200001310001008
	 */

	private String getNextGbIdForNVR() {
		return "1301020000118000" + NVRGBID++;
	}

	private String getNextGbIdForCAMERA() {
		return "1301020000131000" + CAMERAGBID++;
	}

	private String getNextUserEventId() {
		return (DATE_FORMAT_TO_DAY.format(new Date()) + "000000" + +(USER_EVENT_ID++)).replace("-", "");
	}

	/**
	 * 处理摄像机
	 * 
	 * @param lxCamare
	 * @param relateNVR
	 */
	private void handleCamera(Map lxCamare, Map userBasic, String relateNVR) {

		int ChannelSum = (Integer) lxCamare.get("ChannelSum");

		List<String> cameraIdList = new ArrayList<String>();

		for (int i = 0; i < ChannelSum; i++) {

			String unumber = userBasic.get("Unumber").toString();
			String ownerId = "80000"
					+ (unumber.length() > 4 ? unumber.substring(unumber.length() - 4, unumber.length()) : unumber);

			Map<String, Object> cameraMap = new HashMap<String, Object>();
			Map<String, Object> devInfoMap = new HashMap<String, Object>();

			String devTUTKID = Objects.isNullString(lxCamare.get("CloudID")) ? "" : lxCamare.get("CloudID").toString();
			String devLoginName = Objects.isNullString(lxCamare.get("Cuser")) ? "" : lxCamare.get("Cuser").toString();
			String devLoginPwd = Objects.isNullString(lxCamare.get("Cpwd")) ? "" : lxCamare.get("Cpwd").toString();
			String videoUrlSufString = ":9000/" + devTUTKID + ":0:P2P_NPC:" + i + ":1:"
					+ devLoginName + ":" + devLoginPwd + "/av_stream";

			String devId = getNextCameraDevId();

			// 摄像机信息
			cameraMap.put("devId", devId);
			cameraMap.put("devChannelId", i);
			cameraMap.put("videoUrlSuf", videoUrlSufString);
			cameraMap.put("cameraName", userBasic.get("Uname") + "-" + i);
			cameraMap.put("cameraModeId", -1);
			cameraMap.put("updatetime", CREATE_DATE);
			cameraMap.put("syncTime", CREATE_DATE);
			cameraMap.put("dataFrom", PLATFORM_ID);
			cameraMap.put("relateNVR", relateNVR);
			cameraMap.put("devMonitorId", "000" + i);

			// 设备基本信息
			devInfoMap.put("devId", devId);
			devInfoMap.put("devName", userBasic.get("Uname") + "-" + i);
			devInfoMap.put("devType", 12);
			devInfoMap.put("devModelId", "900000002");
			devInfoMap.put("devLng", userBasic.get("UmapLatLng").toString().split(",")[1]);
			devInfoMap.put("devlat", userBasic.get("UmapLatLng").toString().split(",")[0]);
			devInfoMap.put("devState", 2);
			devInfoMap.put("updatetime", CREATE_DATE);
			devInfoMap.put("syncTime", CREATE_DATE);
			devInfoMap.put("relateNVR", relateNVR);
			devInfoMap.put("manufacturer", "P2P_NPC");
			devInfoMap.put("define5", getNextGbIdForCAMERA());
			devInfoMap.put("dataFrom", PLATFORM_ID);
			devInfoMap.put("platformId", PLATFORM_ID);

			// 用户监控点
			Map<String, Object> ownermonitorMap = new HashMap<String, Object>();
			ownermonitorMap.put("ownerId", ownerId);
			ownermonitorMap.put("devId", relateNVR);
			ownermonitorMap.put("devMonitorId", "000" + i);
			ownermonitorMap.put("ownerMonitorId", "000" + i);


			try {
				MysqlDatabase.getDb().exec(
						String.format(INSERT_SQL, "imm_devinfo", SqlGenerateUtils.generateSqlForInsert(devInfoMap)),
						SqlGenerateUtils.getInsertValues(devInfoMap));

				MysqlDatabase.getDb().exec(
						String.format(INSERT_SQL, "imm_camera", SqlGenerateUtils.generateSqlForInsert(cameraMap)),
						SqlGenerateUtils.getInsertValues(cameraMap));

				MysqlDatabase.getDb()
						.exec(String.format(INSERT_SQL, "imm_ownermonitor",
								SqlGenerateUtils.generateSqlForInsert(ownermonitorMap)),
								SqlGenerateUtils.getInsertValues(ownermonitorMap));

				devIds.add(devId);

			} catch (Exception e) {
				LOGGER.error(e.getMessage(), e);
			}
		}

	}

	/**
	 * 处理互联网NVR
	 */
	@SuppressWarnings("rawtypes")
	private void handleNVR(Map userBasic) {

		Map<String, Object> devInfoMap = new HashMap<String, Object>();
		Map<String, Object> netnvrattrMap = new HashMap<String, Object>();
		// devId: 80002+UserBasic.Unumber后四位
		String unumber = userBasic.get("Unumber").toString();
		String devId = "80002"
				+ (unumber.length() > 4 ? unumber.substring(unumber.length() - 4, unumber.length()) : unumber);
		// devName："NVR："+UserBasic.Uname
		String uname = userBasic.get("Uname").toString();

		String devName = "NVR:" + (uname.length() > 4 ? uname.substring(uname.length() - 4, uname.length()) : uname);

		devInfoMap.put("devId", devId);
		devInfoMap.put("pnlActID", "");
		devInfoMap.put("devName", devName);
		devInfoMap.put("areaId", AREAID);
		devInfoMap.put("devType", 10);
		devInfoMap.put("devModelId", DEV_MODEL_ID);

		// ownerId: 80000+UserBasic.Unumber后四位
		String ownerId = "80000"
				+ (unumber.length() > 4 ? unumber.substring(unumber.length() - 4, unumber.length()) : unumber);
		devInfoMap.put("ownerId", ownerId);
		devInfoMap.put("devLng", userBasic.get("UmapLatLng").toString().split(",")[1]);
		devInfoMap.put("devlat", userBasic.get("UmapLatLng").toString().split(",")[0]);
		devInfoMap.put("devState", 2);
		devInfoMap.put("instMan", "");
		devInfoMap.put("instUnit", "");
		devInfoMap.put("pnlAddr", "");
		devInfoMap.put("serverId", null);
		devInfoMap.put("mapId", null);
		devInfoMap.put("updatetime", CREATE_DATE);
		devInfoMap.put("syncTime", CREATE_DATE);
		devInfoMap.put("relateNVR", null);
		devInfoMap.put("manufacturer", "P2P_NPC");
		// 国标ID，未确定
		devInfoMap.put("define5", getNextGbIdForNVR());

		String instDate = CREATE_DATE;

		List<Map> instDates = MysqlDatabase.getDb().findAll("select instDate from imm_customerattr where userId=?",
				ownerId);

		if (Objects.isNotNull(instDates) && Objects.isNotNullString(instDates.get(0).get("instDate"))) {
			instDate = instDates.get(0).get("instDate").toString();
		}

		devInfoMap.put("devInstDate", instDate);
		devInfoMap.put("dataFrom", PLATFORM_ID);
		devInfoMap.put("platformId", PLATFORM_ID);

		netnvrattrMap.put("devId", devId);

		List<Map> cameras = SqlServerDatabase.getDb().findAll("select top 1 * from Camera where Cid=?",
				userBasic.get("CameraID"));

		if (Objects.isNull(cameras)) {
			LOGGER.info("用户  Unumber:{} 在 Camera 表中未找到匹配项...", unumber);
			return;
		}

		Map camera = cameras.get(0);

		netnvrattrMap.put("devId", devId);
		netnvrattrMap.put("devTUTKID", camera.get("CloudID"));
		netnvrattrMap.put("devLoginName", camera.get("Cuser"));
		netnvrattrMap.put("devLoginPwd", camera.get("Cpwd"));
		netnvrattrMap.put("videoServer", VEDIO_SERVER);
		netnvrattrMap.put("dataFrom", PLATFORM_ID);

		try {
			MysqlDatabase.getDb().exec(
					String.format(INSERT_SQL, "imm_devinfo", SqlGenerateUtils.generateSqlForInsert(devInfoMap)),
					SqlGenerateUtils.getInsertValues(devInfoMap));

			MysqlDatabase.getDb().exec(
					String.format(INSERT_SQL, "imm_netnvrattr", SqlGenerateUtils.generateSqlForInsert(netnvrattrMap)),
					SqlGenerateUtils.getInsertValues(netnvrattrMap));

			devIds.add(devId);
		} catch (Exception e) {
			LOGGER.error(e.getMessage(), e);
		}

		handleCamera(camera, userBasic, devId);

	}

	/**
	 * 处理报警主机防区
	 */
	@SuppressWarnings("rawtypes")
	private void handleDevZone(String devId, String aid) {

		String ownerId = devId;

		List<Map> facilityModules = SqlServerDatabase.getDb().findAll("select top 1 * from FacilityModule where Aid=?",
				aid);

		if (Objects.isNull(facilityModules)) {
			LOGGER.info("报警主机 {} 在 主机-模块关联表未找到匹配项...", aid);
			return;
		}
		String mid = facilityModules.get(0).get("Mid").toString();

		List<Map> defences = SqlServerDatabase.getDb().findAll("select * from Defence where Mid=?", mid);

		for (Map map : defences) {

			Map<String, Object> devzoneMap = new HashMap<String, Object>();

			devzoneMap.put("devId", devId);

			String devZoneId = map.get("Dnumber").toString();

			// 位数不够4位，在前面补 0
			while (devZoneId.length() < 4) {
				devZoneId = "0" + devZoneId;
			}
			devzoneMap.put("devZoneId", devZoneId);

			List<Map> dnames = SqlServerDatabase.getDb().findAll("select top 1 * from DefenceType where DTid=?",
					map.get("Dtypeid"));

			if (Objects.isNull(dnames)) {
				LOGGER.info("SQLServer 报警主机 aid:{} 在 DefenceType 表未找到匹配项...", aid);
				continue;
			}
			
			List<Map> snModels = MysqlDatabase.getDb().findAll("select * from imm_snmodel where snModelName=?",
					dnames.get(0).get("Dname"));

			int snModeId = 132;
			if (Objects.isNull(snModels)) {
				snModelNotFound.add(dnames.get(0).get("Dname").toString());
			} else {
				snModeId = (Integer) snModels.get(0).get("snModelId");
			}

			devzoneMap.put("snModeId", snModeId);

			devzoneMap.put("atPos", map.get("Dsite"));
			// devzoneMap.put("almType", -1);
			devzoneMap.put("snNum", map.get("Dcount"));
			// devzoneMap.put("snType", -1);
			devzoneMap.put("instDate", CREATE_DATE);
			devzoneMap.put("liveDate", CREATE_DATE);
			devzoneMap.put("updatetime", CREATE_DATE);
			devzoneMap.put("syncTime", CREATE_DATE);
			devzoneMap.put("dataFrom", PLATFORM_ID);

			Map<String, Object> ownerZoneMap = new HashMap<String, Object>();
			ownerZoneMap.put("ownerId", ownerId);
			ownerZoneMap.put("devId", devId);
			ownerZoneMap.put("devZoneId", devZoneId);
			ownerZoneMap.put("ownerZoneName", devZoneId);
			ownerZoneMap.put("snModelId", devzoneMap.get("snModeId"));
			ownerZoneMap.put("x", devzoneMap.get("x"));
			ownerZoneMap.put("y", devzoneMap.get("y"));
			ownerZoneMap.put("syncTime", devzoneMap.get("syncTime"));
			ownerZoneMap.put("updatetime", devzoneMap.get("updatetime"));
			ownerZoneMap.put("fMemo", devzoneMap.get("fMemo"));
			ownerZoneMap.put("dataFrom", devzoneMap.get("dataFrom"));

			// cameraIdList
			// 事件配置
			Map<String, Object> ownerevtrecordMap = new HashMap<String, Object>();
			ownerevtrecordMap.put("UserEvtId", getNextUserEventId());
			ownerevtrecordMap.put("ownerId", ownerId);
			ownerevtrecordMap.put("ZoneCHFlag", 1);
			ownerevtrecordMap.put("ZoneCHValue", devZoneId);
			ownerevtrecordMap.put("isVideo", 1);

			String[] channels = map.get("Channel") == null ? new String[] {} : map.get("Channel").toString().split(",");
			String sql = " select devId from imm_camera where relateNVR in ( select devId from imm_devinfo where ownerId='%s' and devType=10 ) and devChannelId in ('%s')";
			List<Map> camares = MysqlDatabase.getDb()
					.findAll(String.format(sql, ownerId, Objects.Joiner("','", channels)));
			List<String> cameraIds = new ArrayList<String>();

			for (Map m : camares) {
				cameraIds.add(m.get("devId").toString());
			}
			ownerevtrecordMap.put("cameraIdList", Objects.Joiner(";", cameraIds));

			try {
				MysqlDatabase.getDb().exec(
					String.format(INSERT_SQL, "imm_devzone", SqlGenerateUtils.generateSqlForInsert(devzoneMap)),
					SqlGenerateUtils.getInsertValues(devzoneMap));

				MysqlDatabase.getDb().exec(
						String.format(INSERT_SQL, "imm_ownerzone", SqlGenerateUtils.generateSqlForInsert(ownerZoneMap)),
						SqlGenerateUtils.getInsertValues(ownerZoneMap));

				MysqlDatabase.getDb()
						.exec(String.format(INSERT_SQL, "imm_ownerevtrecord",
								SqlGenerateUtils.generateSqlForInsert(ownerevtrecordMap)),
								SqlGenerateUtils.getInsertValues(ownerevtrecordMap));

			} catch (Exception e) {
				LOGGER.info("aid={}  mid={}", aid, mid);
				LOGGER.error(e.getMessage(), e);
			}
		}
	}

	/**
	 * 处理设备（报警主机或一键报警）
	 */
	@SuppressWarnings("rawtypes")
	private void handleAlarmHostOrOneClickDev() {

		long count = SqlServerDatabase.getDb().count("AlarmFacility");
		int pages = (int) Math.ceil((count * 1.0 / LIMIT));

		LOGGER.info("AlarmFacility 共有记录 {}，{} 页", count, pages);

		for (int page = 1; page <= pages; page++) {

			LOGGER.info("开始处理第 {} 页 ...", page);

			int offset = (page - 1) * LIMIT;

			List<Map> alarmFacilitys = SqlServerDatabase.getDb().findAll("select top " + LIMIT
					+ " * from AlarmFacility where Aid not in (select top " + offset + " Aid from AlarmFacility)");

			for (Map map : alarmFacilitys) {

				String aid = map.get("Aid").toString();

				List<Map> userBasics = SqlServerDatabase.getDb().findAll("select * from UserBasic where Uid=?", aid);
				if (Objects.isNull(userBasics)) {
					LOGGER.info("报警主机(一键报警) {} 在用户表中未找到匹配项 ...", aid);
					continue;
				}

				Map<String, Object> devInfoMap = new HashMap<String, Object>();
				Map<String, Object> alarmhostattrMap = new HashMap<String, Object>();
				Map<String, Object> oneClickattrMap = new HashMap<String, Object>();

				Map userBasic = userBasics.get(0);

				String unumber = userBasic.get("Unumber").toString();

				String groupNum = userBasic.get("GroupNum").toString();

				if (!unumber.startsWith("00") || !groupNum.startsWith("902022")) {
					LOGGER.info("跳过报警主机资料：aid：{}", aid);
					continue;
				}


				Object Tname = SqlServerDatabase.getDb().firstColumn("select top 1 Tname from Fmodel where Tid=?",
						map.get("Tid"));

				String TnameString = ((List) Tname).get(0).toString().trim();

				List<Map> devModels = MysqlDatabase.getDb()
						.findAll("select * from imm_devmodel where devModelName=?",
								TnameString);

				String devModelId = "";
				if (Objects.isNull(devModels)) {
					LOGGER.info("设备型号 `{}` 缺失...", Tname);
					devModelNotFound.add(Tname.toString());
					continue;
				} else {
					devModelId = devModels.get(0).get("devModelId").toString();
				}
				devInfoMap.put("devModelId", devModelId);

				// 报警主机devId ,80000+UserBasic.Unumber后四位
				// 一键报警设备devId ,80003+UserBasic.Unumber后四位
				String nnumber = userBasic.get("Unumber").toString();
				String devId = "";
				String devName = "";
				String ownerId = "";

				// 设备型号是LX9201、LX90202的，是一键式报警设备+视频
				if ("LX9201".equals(TnameString) || "LX9202".equals(TnameString)) {
					devInfoMap.put("devType", 15);
					devId = "80003" + (nnumber.length() > 4 ? nnumber.substring(nnumber.length() - 4, nnumber.length())
							: nnumber);

					ownerId = "80000"
							+ (nnumber.length() > 4 ? nnumber.substring(nnumber.length() - 4, nnumber.length())
									: nnumber);

					// devName ,"报警主机："+UserBasic.Uname
					devName = "一键报警：" + userBasic.get("Uname");
				} else {
					devInfoMap.put("devType", 1);
					devId = "80000" + (nnumber.length() > 4 ? nnumber.substring(nnumber.length() - 4, nnumber.length())
							: nnumber);
					// devName ,"报警主机："+UserBasic.Uname
					devName = "报警主机：" + userBasic.get("Uname");

					ownerId = devId;
				}

				devInfoMap.put("devId", devId);
				devInfoMap.put("devName", devName);
				devInfoMap.put("pnlActID", "");
				devInfoMap.put("areaId", AREAID);
				// devModelId:根据Tid进行转换

				devInfoMap.put("ownerId", ownerId);
				devInfoMap.put("devLng", userBasic.get("UmapLatLng").toString().split(",")[1]);
				devInfoMap.put("devlat", userBasic.get("UmapLatLng").toString().split(",")[0]);
				devInfoMap.put("pnlAddr", map.get("Asite"));

				String instDate = CREATE_DATE;

				if (Objects.isNotNullString(map.get("AinstallDate"))) {
					instDate = map.get("AinstallDate").toString();
					instDate = instDate.length() > 10 ? instDate.substring(0, 10) : instDate;
				}

				devInfoMap.put("devInstDate", instDate);
				devInfoMap.put("devState", 2);
				devInfoMap.put("instMan", "");
				
				String cid = map.get("Cid") == null ? "" : map.get("Cid").toString();

				List<Map> constructs = SqlServerDatabase.getDb().findAll("select * from Construct where Cid=?", cid);

				String instUnit = "";
				if (Objects.isNotNullString(constructs)) {
					Map construct = constructs.get(0);
					instUnit = construct.get("Ccompany") == null ? "" : construct.get("Ccompany").toString();

				}

				devInfoMap.put("instUnit", instUnit);
				devInfoMap.put("pnlAddr", "");
				devInfoMap.put("serverId", null);
				devInfoMap.put("mapId", null);
				devInfoMap.put("manufacturer", "P2P_NPC");
				devInfoMap.put("fMemo", "");
				devInfoMap.put("updatetime", CREATE_DATE);
				devInfoMap.put("controlType", "both");
				devInfoMap.put("dataFrom", PLATFORM_ID);
				devInfoMap.put("platformId", PLATFORM_ID);


				if (devInfoMap.get("devType") == Integer.valueOf(1)) {
					alarmhostattrMap.put("devId", devId);
					alarmhostattrMap.put("pnlTel", "");
					alarmhostattrMap.put("pnlHdTel", map.get("Atel"));
					alarmhostattrMap.put("RegexPWD", "");
					alarmhostattrMap.put("telAddr", "");
					alarmhostattrMap.put("keyboardAddr", "");
					alarmhostattrMap.put("pnlPowerAddr", "");
					alarmhostattrMap.put("updatetime", CREATE_DATE);
				} else {
					oneClickattrMap.put("devId", devId);

					List<Map> cameras = SqlServerDatabase.getDb().findAll("select top 1 * from Camera where Cid=?",
							userBasic.get("CameraID"));

					String devSn = "";
					if (Objects.isNotNull(cameras)) {
						devSn = cameras.get(0).get("CloudID") == null ? "" : cameras.get(0).get("CloudID").toString();
					}

					oneClickattrMap.put("devSn", devSn);
					oneClickattrMap.put("IP", VEDIO_SERVER);
					oneClickattrMap.put("PORT", 9000);
					oneClickattrMap.put("tunnelId", "");
					oneClickattrMap.put("playCode", "");
					oneClickattrMap.put("loginName", "admin");
					oneClickattrMap.put("loginPwd", "");
					oneClickattrMap.put("communicateLine", -1);
					oneClickattrMap.put("communicateProtocol", -1);
					oneClickattrMap.put("dataFrom", PLATFORM_ID);
					oneClickattrMap.put("updatetime", CREATE_DATE);
				}

				try {
					MysqlDatabase.getDb().exec(
							String.format(INSERT_SQL, "imm_devinfo", SqlGenerateUtils.generateSqlForInsert(devInfoMap)),
							SqlGenerateUtils.getInsertValues(devInfoMap));

					if (devInfoMap.get("devType") == Integer.valueOf(1)) {
						MysqlDatabase.getDb()
								.exec(String.format(INSERT_SQL, "imm_alarmhostattr",
										SqlGenerateUtils.generateSqlForInsert(alarmhostattrMap)),
										SqlGenerateUtils.getInsertValues(alarmhostattrMap));
						handleDevZone(devId, aid);
					} else {
						MysqlDatabase.getDb()
								.exec(String.format(INSERT_SQL, "imm_one_click_dev_attr",
										SqlGenerateUtils.generateSqlForInsert(oneClickattrMap)),
										SqlGenerateUtils.getInsertValues(oneClickattrMap));
					}

					devIds.add(devId);
				} catch (Exception e) {
					LOGGER.error(e.getMessage(), e);
				}

			}

			LOGGER.info("第 {} 页处理完成 ...", page);
		}
	}

	/**
	 * 处理联系人
	 */
	private void handleUsercont(String userId,String uid) {

		List<Map> userContacters = SqlServerDatabase.getDb().findAll("select top 1 * from UserContacter");

		if (Objects.isNull(userContacters)) {
			LOGGER.info("用户  {} 无联系人 ...", uid);
			return;
		}
		Map<String, Object> UserContacterMap = userContacters.get(0);
		String cid = UserContacterMap.get("cid").toString();


		List<Map> contacters = SqlServerDatabase.getDb().findAll("select * from Contacter where cid=?", cid);

		int contId = 1;

		for (Map map : contacters) {
			
			Map<String,Object> usercontMap = new HashMap<String,Object>();
			usercontMap.put("userId", userId);
			usercontMap.put("contId", contId);
			usercontMap.put("cName", map.get("Contacter"));
			usercontMap.put("cphone1", map.get("Ctel"));
			usercontMap.put("dataFrom", PLATFORM_ID);

			try {
				MysqlDatabase.getDb().exec(
						String.format(INSERT_SQL, "imm_usercont", SqlGenerateUtils.generateSqlForInsert(usercontMap)),
						SqlGenerateUtils.getInsertValues(usercontMap));
			} catch (Exception e) {
				LOGGER.error(e.getMessage(), e);
			}
			contId++;
		}
	}

	/**
	 * 处理用户信息
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	private void handleUserInfo() {

		long count = SqlServerDatabase.getDb().count("UserBasic");
		int pages = (int) Math.ceil((count * 1.0 / LIMIT));
		LOGGER.info("UserBasic 共有记录 {}，{} 页", count, pages);

		for (int page = 1; page <= pages; page++) {

			LOGGER.info("开始处理第 {} 页 ...", page);

			int offset = (page - 1) * LIMIT;

			List<Map> userBasics = SqlServerDatabase.getDb().findAll(
					"select top " + LIMIT + " * from UserBasic where Uid not in (select top " + offset
							+ " Uid from UserBasic) ");

			for (Map userBasic : userBasics) {

				// 80000+Unumber后四位
				String unumber = userBasic.get("Unumber").toString();
				
				String groupNum =userBasic.get("GroupNum").toString();
				
				if (!unumber.startsWith("00") || !groupNum.startsWith("902022")) {
					LOGGER.info("跳过用户资料：unumber：{}，groupNum：{}", unumber, groupNum);
					continue;
				}
				
				String userId = "80000"
						+ (unumber.length() > 4 ? unumber.substring(unumber.length() - 4, unumber.length()) : unumber);

				Map<String, Object> userInfoMap = new HashMap<String, Object>();
				Map<String, Object> customerattrMap = new HashMap<String, Object>();

				userInfoMap.put("userId", userId);
				userInfoMap.put("userName", userBasic.get("Uname"));
				userInfoMap.put("areaId", AREAID);
				userInfoMap.put("userType", 1);
				userInfoMap.put("fMemo", userBasic.get("Uremark"));

				userInfoMap.put("createDate", CREATE_DATE);
				userInfoMap.put("platformId", PLATFORM_ID);
				userInfoMap.put("dataFrom", PLATFORM_ID);
				
				customerattrMap.put("userId", userId);
				customerattrMap.put("userAddr", userBasic.get("Uaddress").toString());
				customerattrMap.put("userProperty", "0");// 默认已注册

				String uType = userBasic.get("Utype").toString();

				if (businessMap.containsKey(uType)) {
					uType = businessMap.get(uType).trim();
				}

				List<Map> businesses = MysqlDatabase.getDb().findAll("select * from imm_business where businessName=?",
						uType);

				Map<String, Object> business = new HashMap<String, Object>();
				if (Objects.isNull(businesses)) {
					businessNotFound.add(userBasic.get("Utype").toString());
					business.put("1", "保险");
				} else {
					business = businesses.get(0);
				}

				customerattrMap.put("businessId", business.get("Id")); // 根据Utype转换
				customerattrMap.put("businessName", business.get("businessName")); // 根据Utype转换

				customerattrMap.put("isHost", 1);
				customerattrMap.put("contact", userBasic.get("Uprincipal").toString());
				customerattrMap.put("cPhone", userBasic.get("UpTel").toString());
				customerattrMap.put("userServerType", 4);
				customerattrMap.put("nomRpt", 0);
				customerattrMap.put("engageTest", 0);
				customerattrMap.put("nomTest", 0);
				customerattrMap.put("isVideoCheck", 0);
				customerattrMap.put("isInsurance", 0);
				customerattrMap.put("hasBak", 0);
				customerattrMap.put("isPay", 0);

				List<Map> alarmFacilitys = SqlServerDatabase.getDb()
						.findAll("select top 1 * from AlarmFacility where Aid=?", userBasic.get("Uid"));
				Map alarmFacility = alarmFacilitys.get(0);

				String instDate = CREATE_DATE;

				if (Objects.isNullString(alarmFacility.get("AinstallDate"))) {
					instDate = alarmFacility.get("AinstallDate").toString();
				}
				customerattrMap.put("instDate", instDate);
				customerattrMap.put("pnlHdTel", alarmFacility.get("Atel"));
				customerattrMap.put("dataFrom", PLATFORM_ID);

				try {

					MysqlDatabase.getDb()
							.exec(String.format(INSERT_SQL, "imm_userinfo",
									SqlGenerateUtils.generateSqlForInsert(userInfoMap)),
									SqlGenerateUtils.getInsertValues(userInfoMap));

					MysqlDatabase.getDb()
							.exec(String.format(INSERT_SQL, "imm_customerattr",
									SqlGenerateUtils.generateSqlForInsert(customerattrMap)),
									SqlGenerateUtils.getInsertValues(customerattrMap));

					userIds.add(userId);
				} catch (Exception e) {
					LOGGER.error(e.getMessage(), e);
				}

				handleNVR(userBasic);
				handleUsercont(userId, userBasic.get("Uid").toString());
			}

			LOGGER.info("第 {} 页 处理完成...", page);
		}
	}

}
