USE [master]
GO
/****** Object:  Database [TestDiakont]    Script Date: 11.10.2018 13:08:16 ******/
CREATE DATABASE [TestDiakont]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TestDiakont', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\TestDiakont.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TestDiakont_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\TestDiakont_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [TestDiakont] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TestDiakont].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TestDiakont] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TestDiakont] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TestDiakont] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TestDiakont] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TestDiakont] SET ARITHABORT OFF 
GO
ALTER DATABASE [TestDiakont] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TestDiakont] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TestDiakont] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TestDiakont] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TestDiakont] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TestDiakont] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TestDiakont] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TestDiakont] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TestDiakont] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TestDiakont] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TestDiakont] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TestDiakont] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TestDiakont] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TestDiakont] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TestDiakont] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TestDiakont] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TestDiakont] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TestDiakont] SET RECOVERY FULL 
GO
ALTER DATABASE [TestDiakont] SET  MULTI_USER 
GO
ALTER DATABASE [TestDiakont] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TestDiakont] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TestDiakont] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TestDiakont] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TestDiakont] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TestDiakont', N'ON'
GO
ALTER DATABASE [TestDiakont] SET QUERY_STORE = OFF
GO
USE [TestDiakont]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [TestDiakont]
GO
/****** Object:  User [UserDiakont]    Script Date: 11.10.2018 13:08:16 ******/
CREATE USER [UserDiakont] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[UserDiakont]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [UserDiakont]
GO
/****** Object:  Schema [UserDiakont]    Script Date: 11.10.2018 13:08:17 ******/
CREATE SCHEMA [UserDiakont]
GO
/****** Object:  Table [dbo].[BetwRate]    Script Date: 11.10.2018 13:08:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BetwRate](
	[id_BetwRate] [int] IDENTITY(1,1) NOT NULL,
	[StartDate] [date] NULL,
	[WageRate] [int] NULL,
	[id_pos] [int] NULL,
 CONSTRAINT [PK_BetwRate] PRIMARY KEY CLUSTERED 
(
	[id_BetwRate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dep]    Script Date: 11.10.2018 13:08:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dep](
	[id_dep] [int] IDENTITY(1,1) NOT NULL,
	[NameDep] [nvarchar](max) NULL,
 CONSTRAINT [PK_Dep] PRIMARY KEY CLUSTERED 
(
	[id_dep] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pos]    Script Date: 11.10.2018 13:08:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pos](
	[id_pos] [int] IDENTITY(1,1) NOT NULL,
	[NamePos] [nvarchar](max) NULL,
	[id_dep] [int] NULL,
 CONSTRAINT [PK_Pos] PRIMARY KEY CLUSTERED 
(
	[id_pos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rate-old]    Script Date: 11.10.2018 13:08:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rate-old](
	[id_rate] [int] IDENTITY(1,1) NOT NULL,
	[id_pos] [int] NULL,
	[id_dep] [int] NULL,
 CONSTRAINT [PK_rate] PRIMARY KEY CLUSTERED 
(
	[id_rate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ss]    Script Date: 11.10.2018 13:08:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ss](
	[id_ss] [int] IDENTITY(1,1) NOT NULL,
	[id_dep] [int] NULL,
	[id_pos] [int] NULL,
	[StartDate] [date] NULL,
	[CountPos] [int] NULL,
 CONSTRAINT [PK_ss] PRIMARY KEY CLUSTERED 
(
	[id_ss] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[AddPosInDep]    Script Date: 11.10.2018 13:08:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[AddPosInDep] 

@id_dep int,
@id_pos int,
@StartDate Date,
@CountPos int


AS
 /** Процедура добавления кол-ва должностей для каждого подразделения с указанием даты начала действия. Используется в PosInDep **/

 /** Проверка на существование записей **/

 DECLARE @CountRec Int
 SET @CountRec=0

 SET @CountRec=(SELECT COUNT(*) FROM ss WHERE ss.id_pos=@id_pos)
 
 /** Если есть записи, то высчитываем последнюю дату **/
 DECLARE @MAXDATE DATE
 IF @CountRec>0
 BEGIN
  SET @MAXDATE=(SELECT MAX(StartDate) FROM ss WHERE ss.id_pos=@id_pos)
 END


 /** Если Введенная дата больше последней или нет вообще записей, то добавляем **/
 IF (@StartDate>@MAXDATE) OR (@CountRec=0)
   
 BEGIN 
    INSERT INTO [dbo].[ss] (id_dep,id_pos,StartDate,CountPos)
    VALUES  (@id_dep,@id_pos,@StartDate,@CountPos)
	RETURN 1
END    

RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[BetwRateIntervalDatePos]    Script Date: 11.10.2018 13:08:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[BetwRateIntervalDatePos]
	
	-- Add the parameters for the stored procedure here
	(
	@id_pos int,
	@FromDate Date,
	@ToDate Date
	)
AS
BEGIN


	SELECT pos.id_pos,Pos.NamePos,BetwRate.StartDate,BetwRate.WageRate FROM BetwRate,Pos 
	WHERE (BetwRate.id_pos=@id_pos) AND (BetwRate.StartDate>=@FromDate) AND (BetwRate.StartDate<@ToDate) AND  (BetwRate.id_pos=Pos.id_pos)
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_Rate-old]    Script Date: 11.10.2018 13:08:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Insert_Rate-old] 
@id_rate int,
@StartDate Datetime,
@WageRate int, 
@Cnt int
AS
 BEGIN 

	WHILE @Cnt>0 
	 BEGIN
       INSERT INTO BetwRate(id_rate,StartDate,WageRate)  
       VALUES (@id_rate,@StartDate,@WageRate); 
       SET @Cnt=@Cnt-1;
	END 
END
GO
/****** Object:  StoredProcedure [dbo].[PosInDep]    Script Date: 11.10.2018 13:08:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PosInDep] 
@id_dep int=0
AS
/** Должности в отделении**/
BEGIN

 SELECT ss.id_ss, ss.id_dep, ss.id_pos, ss.StartDate, ss.CountPos, Pos.NamePos
           FROM   ss INNER JOIN
           Pos ON ss.id_pos = Pos.id_pos
    WHERE  (ss.id_dep = @id_dep)

END
GO
/****** Object:  StoredProcedure [dbo].[RateDate-old]    Script Date: 11.10.2018 13:08:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[RateDate-old] 
@StartDate Date

AS
 BEGIN 
   SELECT        Dep.id_dep, Pos.id_pos, BetwRate.id_BetwRate, BetwRate.StartDate, BetwRate.EndDate, BetwRate.WageRate, Pos.NamePos, Dep.NameDep
   FROM            BetwRate,Dep, Pos


   WHERE   (StartDate BETWEEN @StartDate AND DATEADD(MONTH, 0, @StartDate))
   

END    
GO
/****** Object:  StoredProcedure [dbo].[RateInPos]    Script Date: 11.10.2018 13:08:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[RateInPos] 
@id_pos int=0
AS
/** Ставки для выбранной позиции. Используется для отображения ставок в RateEdit**/
BEGIN
		SELECT        BetwRate.*
		FROM            BetwRate
                         
		WHERE        (BetwRate.id_pos = @id_pos)

END
GO
/****** Object:  StoredProcedure [dbo].[ReportFromToDate]    Script Date: 11.10.2018 13:08:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ReportFromToDate]
(@FromDate Date,
@ToDate Date
)

AS


/** Проверка на существование предыдущей временной таблицы в текущей сессии **/
IF OBJECT_ID('#ReportDiakont') IS NOT NULL
BEGIN
    DROP TABLE #ReportDiakont
END




CREATE TABLE #ReportDiakont
(Dep NVARCHAR(50),
DateFrom Date,
DateTo Date,
FOT INT)







--Получаем кол-во записей   
DECLARE  @CntRec INT
SET @CntRec=(SELECT Count(*) FROM BetwRate  WHERE (StartDate>=@FromDate AND StartDate<@ToDate) )

PRINT @CntRec


DECLARE @id_BetwRate int
--DECLARE @NameDep Varchar(50)
DECLARE @StartDate date
DECLARE @WageRate int
DECLARE @id_pos int
DECLARE @FOT int

 -- select id_BetwRate,id_rate,StartDate,WageRate  from BetwRate  WHERE (StartDate>=@FromDate AND StartDate<@ToDate)

--SELECT * FROM #ReportDiakont

IF (@CntRec=0)/** Если нет записей**/
begin
  RETURN 0
end

/**IF (@CntRec>0) **/


/** Если одна запись, то вставляем строку **/
IF (@CntRec=1)
BEGIN
  --select @id_BetwRate=id_BetwRate,@StartDate=StartDate,@WageRate=WageRate,@NameDep=NameDep  from BetwRate,Pos,Dep  WHERE (StartDate>=@FromDate AND StartDate<@ToDate)  AND (BetwRate.id_pos=pos.id_pos) AND (Pos.id_dep=Dep.id_dep)
select @id_BetwRate=id_BetwRate,@StartDate=StartDate,@WageRate=WageRate  from BetwRate,Pos,Dep  WHERE (StartDate>=@FromDate AND StartDate<@ToDate) -- AND (BetwRate.id_pos=pos.id_pos) AND (Pos.id_dep=Dep.id_dep)

--  INSERT INTO #ReportDiakont (Dep,DateFrom,DateTo,FOT,Dep) VALUES (@NameDep,@StartDate,@ToDate,@WageRate,@NameDep)
  INSERT INTO #ReportDiakont (DateFrom,DateTo,FOT) VALUES (@StartDate,@ToDate,@WageRate)

  PRINT @StartDate
  PRINT @WageRate
  RETURN 1
END



/** Если несколько записей, то вставляем по одной  **/
IF (@CntRec>1)
BEGIN
  
	declare some_cursor cursor
	
	 for  select id_BetwRate,StartDate,WageRate  from BetwRate  WHERE (StartDate>=@FromDate AND StartDate<@ToDate)AND (BetwRate.id_pos=1)

    --for  select id_BetwRate,StartDate,WageRate,NameDep  from BetwRate,Pos,Dep  WHERE (StartDate>=@FromDate AND StartDate<@ToDate)  AND (BetwRate.id_pos=pos.id_pos) AND (Pos.id_dep=Dep.id_dep) ORDER BY dep.id_dep, BetwRate.id_pos,BetwRate.StartDate



    --select id_BetwRate,StartDate,WageRate,NameDep  from BetwRate,Pos,Dep  WHERE (StartDate>=@FromDate AND StartDate<@ToDate)  AND (BetwRate.id_pos=pos.id_pos) AND (Pos.id_dep=Dep.id_dep) ORDER BY dep.id_dep, BetwRate.id_pos,BetwRate.StartDate




	-- открываем курсор
	open some_cursor;
	

	-- выборка первой  строки и сохранение в переменные
--	fetch next from some_cursor INTO @id_BetwRate,  @StartDate,@FOT, @NameDep
	fetch next from some_cursor INTO @id_BetwRate,  @StartDate,@FOT
	-- Переходим на 2-ю запись 
	
	-- fetch next from some_cursor INTO @id_BetwRate, @StartDate,@Wagerate, @NameDep
  fetch next from some_cursor INTO @id_BetwRate, @StartDate,@Wagerate


	-- Первая дата=первой дате, Конечная = следующей дате (строке)
---	INSERT INTO #ReportDiakont (DateFrom,DateTo,FOT,Dep) VALUES (@FromDate,@StartDate,@FOT,@NameDep)
	INSERT INTO #ReportDiakont (DateFrom,DateTo,FOT) VALUES (@FromDate,@StartDate,@FOT)

	-- цикл с логикой и выборкой всех последующих строк после вторая
--PRINT @Wagerate

-- ***************************Формирование первой строки работает корректно ************************

	

	declare @CurRec int
	SET @CurRec=2
	--Declare @TmpSrting Varchar (50)
	DECLARE @FRDate Date -- FromDate - временная

 while @@FETCH_STATUS = 0
  begin
  
		  --FETCH  from some_cursor INTO @id_BetwRate, @StartDate,@WageRate,@NameDep	
		  PRINT '11'
		  PRINT @WageRate

		  
		  PRINT '22'
		  PRINT @WageRate

			
			SET @FRDate=@StartDate-- Запоминаем начальную дату для новой таблицы столбца FromDate
			SET @FOT=@WageRate -- Сумма		  
		  	
                

              


       -- выборка следующей строки
       -- fetch  from some_cursor INTO  @id_BetwRate, @StartDate,@WageRate,@NameDep
	   fetch  from some_cursor INTO  @id_BetwRate, @StartDate,@WageRate
        
		

	
	    -- Вставка данных во временную таблицу
       -- INSERT INTO #ReportDiakont (DateFrom,DateTo,FOT,Dep) VALUES (@FrDate,@StartDate,@FOT,@NameDep)
	   INSERT INTO #ReportDiakont (DateFrom,DateTo,FOT) VALUES (@FrDate,@StartDate,@FOT)




	SET @CurRec=@CurRec+1 -- Счетчик проходов
	
 end -- while


-- Если последняя запись

			-- Вставляем значения полей в переменные
		--	INSERT INTO #ReportDiakont (DateFrom,DateTo,FOT,Dep) VALUES (@StartDate,@ToDate,@WageRate,@NameDep)
			INSERT INTO #ReportDiakont (DateFrom,DateTo,FOT) VALUES (@StartDate,@ToDate,@WageRate)

			PRINT '@CurRec=@CntRec' 
			SELECT * FROM #ReportDiakont
			
   -- закрываем курсор
   close some_cursor
   deallocate some_cursor

RETURN @CntRec

END









GO
/****** Object:  StoredProcedure [dbo].[SSandBetwRateDate]    Script Date: 11.10.2018 13:08:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Andrey Gerus.
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[SSandBetwRateDate] 
	-- Add the parameters for the stored procedure here
	(@id_pos int,
	@FromDate Date,
	@ToDate Date)
AS
BEGIN


	   -- обьявляем курсор для штатного расписания SS c начальной датой и id-должности
	    declare SSIntervalDatePos_cursor cursor static
		
		for SELECT dep.id_dep,dep.NameDep,pos.id_pos,Pos.NamePos,ss.StartDate,ss.CountPos FROM ss,dep,Pos WHERE (ss.id_pos=@id_pos) AND (ss.StartDate>=@FromDate) AND (ss.StartDate<@ToDate) AND (ss.id_dep=dep.id_dep) AND (ss.id_pos=Pos.id_pos)
		
		--SELECT dep.id_dep,dep.NameDep,pos.id_pos,Pos.NamePos,ss.StartDate,ss.CountPos FROM ss,dep,Pos WHERE (ss.id_pos=@id_pos) AND (ss.StartDate>=@FromDate) AND (ss.StartDate<@ToDate) AND (ss.id_dep=dep.id_dep) AND (ss.id_pos=Pos.id_pos)
		
		-- Открываем курсор
		open SSIntervalDatePos_cursor

		-- Создаем переменные для сохранения инф. о штатном расписании
		declare @SS_RecNum int -- номер строки в запросе
		declare @SS_dep_id_dep int -- id_dep
		declare @SS_dep_NameDep Varchar (50) -- Название отделения
		declare @SS_pos_id_pos int   -- ID - должности
		declare @SS_pos_NamePos Varchar(50) -- название дролжности
		declare @SS_StartDate Date -- Дата начала/изменения действия новых штатных единиц
		declare @SS_CountPos int   -- кол-во штатных единиц
		declare @SS_CountRec int -- Кол-во строк в запросе
		
		
		-- 
		FETCH  FROM SSIntervalDatePos_cursor 
		  INTO @SS_dep_id_dep,@SS_dep_NameDep, @SS_pos_id_pos, @SS_pos_NamePos, @SS_StartDate,@SS_CountPos
		
		SET @SS_CountRec=@@CURSOR_ROWS -- Получили кол-во строк в штатном расписании для данной должности

		--PRINT @SS_CountRec
		

		-- выборка первой  строки штатного расписания
			fetch first  from SSIntervalDatePos_cursor INTO  @SS_dep_id_dep,@SS_dep_NameDep, @SS_pos_id_pos, @SS_pos_NamePos, @SS_StartDate,@SS_CountPos
			SET @SS_RecNum=1
			SET @SS_CountRec=@@CURSOR_ROWS -- кол-во строк в курсоре с ставками
			PRINT '@SS_CountRec:'+STR(@SS_CountRec)


				DECLARE @BR_CountRec int -- кол-во строк
				DECLARE @BR_id_pos int 
				DECLARE @BR_StartDate Date
				DECLARE @BR_WageRate int -- ставка
				DECLARE @FOT int -- ФОТ

				/** Проверка на существование предыдущей временной таблицы в текущей сессии **/
				IF OBJECT_ID('#SS') IS NOT NULL
				BEGIN
					DROP TABLE #SS
				END




			CREATE TABLE #SS
				(ID_pos int,
				NameDep Varchar (50),
				NamePos varchar (50),
				FromDate Date,
				ToDate Date,
				WageRate int,
				CountRate int,
				FOT int)


				WHILE @SS_RecNum<=@SS_CountRec
				  BEGIN
				     PRINT '@SS_dep_id_dep:'+STR(@SS_dep_id_dep) PRINT '@SS_dep_NameDep:'+@SS_dep_NameDep PRINT '@SS_pos_id_pos:'+STR(@SS_pos_id_pos) PRINT '@SS_pos_NamePos:'+@SS_pos_NamePos PRINT '@SS_StartDate:'+FORMAT(@SS_StartDate,'dd/MM/yyyy','en-US') PRINT '@SS_RecNum:'+STR(@SS_RecNum)
					 PRINT '--------------------------------------------'
					 
					    
						 -- ************** НАЧАЛО ПРОХОДА по выборке ставок					    
					    declare BetwRateIntervalDatePos_cursor cursor static
						for	select BetwRate.id_pos,BetwRate.StartDate,BetwRate.WageRate from BetwRate WHERE (BetwRate.id_pos=@id_pos) AND (BetwRate.StartDate>=@FromDate) AND (BetwRate.StartDate<@ToDate)  
						 open BetwRateIntervalDatePos_cursor
                         fetch first  from BetwRateIntervalDatePos_cursor INTO  @BR_id_pos,@BR_StartDate, @BR_WageRate
                         SET @BR_CountRec=@@CURSOR_ROWS--Присваевам кол-во строк
						  PRINT '@BR_CountRec='+STR(@BR_CountRec)

                            DECLARE @TotalDate date -- Начальная дата после вычисления и сравнения новизны

						    IF (@SS_CountRec=1) AND (@BR_CountRec=1) -- SS.одна - BR.одна
							   BEGIN
							     -- Чья дата новее, ту и ставим стартовую (проверка на сдвиг дат по шкале времени)
								
								  IF @BR_StartDate>@SS_StartDate SET @TotalDate=@BR_StartDate ELSE SET @TotalDate=@SS_StartDate
								 
								 SET @FOT=@BR_WageRate*@SS_CountPos
								 INSERT INTO #SS (ID_pos,NameDep,NamePos,FromDate,ToDate,WageRate,CountRate,FOT) VALUES (@id_pos,@SS_dep_NameDep,@SS_pos_NamePos,@TotalDate,@ToDate,@BR_WageRate,@SS_CountPos,@FOT)
								 SELECT * FROM #SS
								 close SSIntervalDatePos_cursor
								 close BetwRateIntervalDatePos_cursor
								 deallocate SSIntervalDatePos_cursor
								 deallocate BetwRateIntervalDatePos_cursor
								 
								 RETURN 0
							   END


SET @FOT=@BR_WageRate*@SS_CountPos
INSERT INTO #SS (ID_pos,NameDep,NamePos,FromDate,ToDate,WageRate,CountRate,FOT) VALUES (@id_pos,@SS_dep_NameDep,@SS_pos_NamePos,@TotalDate,@ToDate,@BR_WageRate,@SS_CountPos,@FOT)																		  
/***


***/

							IF (@SS_CountRec=1) AND (@BR_CountRec>1) -- SS.Одна и BR.несколько
							   BEGIN
							     -- Чья дата новее, ту и ставим стартовую (проверка на сдвиг дат)
								DECLARE @LastDate Date
								DECLARE @BR_Next_id_pos int 
								DECLARE @BR_Next_StartDate Date
								DECLARE @BR_Next_WageRate int
								DECLARE @BR_RecNum int -- номер текущей записи
								  IF @BR_StartDate>@SS_StartDate SET @TotalDate=@BR_StartDate ELSE SET @TotalDate=@SS_StartDate
								  
								  fetch next from BetwRateIntervalDatePos_cursor INTO  @BR_Next_id_pos,@BR_Next_StartDate, @BR_Next_WageRate
								  SET @BR_RecNum=2

								 -- Вставляем первую запись
								 SET @FOT=@BR_WageRate*@SS_CountPos
								 INSERT INTO #SS (ID_pos,NameDep,NamePos,FromDate,ToDate,WageRate,CountRate,FOT) VALUES (@id_pos,@SS_dep_NameDep,@SS_pos_NamePos,@TotalDate,@BR_Next_StartDate,@BR_WageRate,@SS_CountPos,@FOT)
								 
								 -- Цикл перебора оставшихся записей
								 IF @BR_RecNum=@BR_CountRec -- Если последняя запись
									BEGIN
								      SET @FOT=@BR_WageRate*@SS_CountPos
									  INSERT INTO #SS (ID_pos,NameDep,NamePos,FromDate,ToDate,WageRate,CountRate,FOT) VALUES (@id_pos,@SS_dep_NameDep,@SS_pos_NamePos,@TotalDate,@ToDate,@BR_WageRate,@SS_CountPos,@FOT)									
									  
									END
									ELSE -- Если не последняя запись
									  BEGIN
								         SET @FOT=@BR_WageRate*@SS_CountPos
										 INSERT INTO #SS (ID_pos,NameDep,NamePos,FromDate,ToDate,WageRate,CountRate,FOT) VALUES (@id_pos,@SS_dep_NameDep,@SS_pos_NamePos,@TotalDate,@ToDate,@BR_WageRate,@SS_CountPos,@FOT)																		  
										 fetch next from BetwRateIntervalDatePos_cursor INTO  @BR_id_pos,@BR_StartDate, @BR_WageRate
									  END

								
								 SELECT * FROM #SS
								 close SSIntervalDatePos_cursor
								 close BetwRateIntervalDatePos_cursor
								 deallocate SSIntervalDatePos_cursor
								 deallocate BetwRateIntervalDatePos_cursor
								 RETURN 0
									
							
							   END
							

							IF (@SS_CountRec>1) AND (@BR_CountRec>1) -- SS.несколько и BR.несколько
							   BEGIN
									PRINT ''
							
							   END


							IF (@SS_CountRec>1) AND (@BR_CountRec=1) -- SS.несколько и BR.несколько
							   BEGIN
									PRINT ''
							
							   END



					     close BetwRateIntervalDatePos_cursor
                         deallocate BetwRateIntervalDatePos_cursor
						-- *************** КОНЕЦ ПРОХОДА по выборке ставок

						

					 SET @SS_RecNum=@SS_RecNum+1
					 fetch ABSOLUTE @SS_RecNum   from SSIntervalDatePos_cursor INTO  @SS_dep_id_dep,@SS_dep_NameDep, @SS_pos_id_pos, @SS_pos_NamePos, @SS_StartDate,@SS_CountPos
				  END
				  




      -- закрываем курсор штаного расписания
		close SSIntervalDatePos_cursor
		deallocate SSIntervalDatePos_cursor
SELECT * FROM #SS

RETURN 0

END
GO
/****** Object:  StoredProcedure [dbo].[SSIntervalDatePos]    Script Date: 11.10.2018 13:08:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SSIntervalDatePos]
	
	-- Add the parameters for the stored procedure here
	(
	@id_pos int,
	@FromDate Date,
	@ToDate Date
	)
AS
BEGIN


	SELECT dep.id_dep,dep.NameDep,pos.id_pos,Pos.NamePos,ss.StartDate,ss.CountPos FROM ss,dep,Pos 
	WHERE (ss.id_pos=@id_pos) AND (ss.StartDate>=@FromDate) AND (ss.StartDate<@ToDate) AND (ss.id_dep=dep.id_dep) AND (ss.id_pos=Pos.id_pos)
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateRate]    Script Date: 11.10.2018 13:08:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROC  [dbo].[UpdateRate] 

@StartDate Datetime,
@WageRate int, 
@id_pos int
AS
 
 /** Добавление ставок в должность. Используетсяв RateEdit**/
DECLARE @MAXDATE DateTime
DECLARE @ROWCNT Int 
 
 SET @MAXDATE= (SELECT MAX(StartDate) as MaxStartDate FROM BetwRate WHERE id_pos=@id_pos)

 SET @ROWCNT=(SELECT COUNT(*) FROM BetwRate WHERE id_pos=@id_pos)


 
 /**SET @ROWCNT=@@ROWCOUNT - не подходит**/

 PRINT '@MAXDATE=' PRINT @MAXDATE
 PRINT '@StartDate=' PRINT @StartDate
 PRINT '@ROWCNT=' PRINT @ROWCNT

 
/****** (Введеная дата больше максимальной или нет записей?)  ******/ 
 IF  (@ROWCNT=0) OR (@StartDate >@MAXDATE)
   BEGIN 
      INSERT INTO BetwRate(StartDate,WageRate,id_pos)  
       VALUES (@StartDate,@WageRate,@id_pos); 
       /**PRINT 'IF (@ROWCNT=0)'**/
	   return 1;
  END
  
 
 


  
  RETURN 0
GO
USE [master]
GO
ALTER DATABASE [TestDiakont] SET  READ_WRITE 
GO
