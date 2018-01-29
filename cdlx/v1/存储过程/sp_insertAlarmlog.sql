--创建存储过程: 插入报警事件
CREATE PROCEDURE [dbo].[sp_insertAlarmlog]
@tablename nvarchar(50),
@unumber nvarchar(50),
@GroupNumber nvarchar(50),
@uname nvarchar(50), 
@uaddress nvarchar(200), 
@facilitymodule nvarchar(50), 
@facilitydefence nvarchar(50), 
@dsite nvarchar(50), 
@eventremark nvarchar(50),
@assistremark nvarchar(50),
@receivetel nvarchar(50), 
@alarmclassify nvarchar(50), 
@occurrencetime nvarchar(50), 
@receivetime nvarchar(50), 
@handletime nvarchar(50), 
@handlecontent nvarchar(50),
@contacter nvarchar(50),
@ctel nvarchar(50), 
@administrator nvarchar(50), 
@Cid nvarchar(50), 
@Dtype nvarchar(50), 
@alarmContent nvarchar(200), 
@RecordPath nvarchar(200), 
@TCPalarmContent nvarchar(200),
@handleFlg nvarchar(50)

AS
DECLARE @sql nvarchar(4000)
SET @sql = 'insert into ' + @tablename + '(unumber,GroupNumber,uname,uaddress,
				facilitymodule,facilitydefence,dsite,eventremark,assistremark,
				receivetel,alarmclassify,occurrencetime,receivetime,handletime,
				handlecontent,contacter,ctel,administrator,Cid,Dtype,alarmContent,
				RecordPath,TCPalarmContent,handleFlg)
			values('+ @unumber + ',' + @GroupNumber + ',' + @uname + ',' + @uaddress + ',' +
				 @facilitymodule + ',' + @facilitydefence + ',' + @dsite + ',' + @eventremark + ',' +
				 @assistremark + ',' + @receivetel + ',' + @alarmclassify + ',' + @occurrencetime + ',' + 
				 @receivetime + ',' + @handletime + ',' + @handlecontent + ',' + @contacter + ',' + 
				 @ctel + ',' + @administrator + ',' + @Cid + ',' + @Dtype + ',' + @alarmContent + ',' +
				 @RecordPath + ',' + @TCPalarmContent +','+@handleFlg +')'

--print @sql

exec(@sql)