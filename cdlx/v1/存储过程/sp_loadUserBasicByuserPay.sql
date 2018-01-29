--创建存储过程: 查询用户基本信息
CREATE     PROCEDURE [dbo].[sp_loadUserBasicByuserPay]
    
as

DECLARE @sql nvarchar(4000)

SET @sql = 'SELECT dbo.UserBasic.Uid, dbo.UserBasic.GroupNum AS 分组编号, 
                                      dbo.UserBasic.Unumber AS 用户编号, dbo.UserBasic.Uname AS 用户名称, 
                                      dbo.UserBasic.Utype AS 用户类型, dbo.UserBasic.Uaddress AS 用户地址, 
                                      dbo.UserBasic.UnetState, dbo.UserBasic.Ustate, dbo.UserBasic.Utest, 
                                      dbo.UserBasic.UsendMsg, dbo.UserBasic.Uschedule,
                                      dbo.AlarmFacility.AlastTime,b.PServiceTime as ServiceTime,dbo.UserBasic.CheckBFOver
                                FROM dbo.UserBasic INNER JOIN
                                      dbo.UserFacility ON dbo.UserBasic.Uid = dbo.UserFacility.Uid INNER JOIN
                                      dbo.AlarmFacility ON dbo.UserFacility.Fic = dbo.AlarmFacility.Aid	left join
                                      (select *from UserPay where UserPay.Pid in(select max(Pid) from UserPay group by PUid)) b on b.Puid=UserBasic.Uid'

exec(@sql)