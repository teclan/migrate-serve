--创建存储过程: 加载防区类型、防区位置
CREATE     PROCEDURE [dbo].[sp_loadZoneType]
    @uid varchar(50) = 0,		--uid
    @Mnumber varchar(50) = 0,	--模块号
    @Dnumber varchar(50) = 0	--防区号
as

DECLARE @sql nvarchar(4000)

SET @sql = 'SELECT dbo.FModule.Mnumber AS 模块编号, dbo.FModule.Model AS 模块型号, 
                          dbo.Defence.Dnumber AS 防区编号, dbo.DefenceType.Dname AS 探测器类型, 
                          dbo.Defence.Dsite AS 防区位置, dbo.Defence.Ddetector AS 探测器型号, 
                          dbo.Defence.Dcount AS 探测器数量
                    FROM dbo.FacilityModule INNER JOIN
                          dbo.AlarmFacility ON dbo.FacilityModule.Aid = dbo.AlarmFacility.Aid INNER JOIN
                          dbo.FModule ON dbo.FacilityModule.Mid = dbo.FModule.Mid INNER JOIN
                          dbo.Defence ON dbo.FModule.Mid = dbo.Defence.Mid INNER JOIN
                          dbo.DefenceType ON dbo.Defence.Dtypeid = dbo.DefenceType.DTid INNER JOIN
                          dbo.UserFacility ON dbo.AlarmFacility.Aid = dbo.UserFacility.Fic
                    WHERE (dbo.UserFacility.Uid = ''' + @uid + ''') and 
                          (dbo.Defence.Dnumber = ''' + @Dnumber + ''') AND                
                          (dbo.FModule.Mnumber = ''' + @Mnumber + ''')'

exec(@sql)