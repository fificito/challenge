USE [master]
GO
/****** Object:  Database [TicTacToe]    Script Date: 01/03/2017 08:39:10 a.m. ******/
CREATE LOGIN [player] WITH PASSWORD=N'Play3r', DEFAULT_DATABASE=[master], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
CREATE DATABASE [TicTacToe] ON  PRIMARY 
( NAME = N'JE', FILENAME = N'D:\DB\TicTacToe.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'JE_log', FILENAME = N'D:\DB\TicTacToe_log.ldf' , SIZE = 1536KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TicTacToe] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TicTacToe].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TicTacToe] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TicTacToe] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TicTacToe] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TicTacToe] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TicTacToe] SET ARITHABORT OFF 
GO
ALTER DATABASE [TicTacToe] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TicTacToe] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [TicTacToe] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TicTacToe] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TicTacToe] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TicTacToe] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TicTacToe] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TicTacToe] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TicTacToe] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TicTacToe] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TicTacToe] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TicTacToe] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TicTacToe] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TicTacToe] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TicTacToe] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TicTacToe] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TicTacToe] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TicTacToe] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TicTacToe] SET RECOVERY FULL 
GO
ALTER DATABASE [TicTacToe] SET  MULTI_USER 
GO
ALTER DATABASE [TicTacToe] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TicTacToe] SET DB_CHAINING OFF 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TicTacToe', N'ON'
GO
USE [TicTacToe]
GO
/****** Object:  User [player]    Script Date: 01/03/2017 08:39:10 a.m. ******/
CREATE USER [player] FOR LOGIN [player] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  StoredProcedure [dbo].[tic_CheckEndGame]    Script Date: 01/03/2017 08:39:10 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[tic_CheckEndGame]
AS

--  Created by: Felipe Maurer
--  Date: Feb 28 2017
--  Purpose: Check if the end of the game is reached and who wins

SET NOCOUNT ON

IF (
       SELECT COUNT(*)
       FROM   tic_Board AS tb
       WHERE  tb.ID_Position IN (1, 2, 3)
              AND tb.[Letter] = 'X'
   ) = 3
   OR (
          SELECT COUNT(*)
          FROM   tic_Board AS tb
          WHERE  tb.ID_Position IN (4, 5, 6)
                 AND tb.[Letter] = 'X'
      ) = 3
   OR (
          SELECT COUNT(*)
          FROM   tic_Board AS tb
          WHERE  tb.ID_Position IN (7, 8, 9)
                 AND tb.[Letter] = 'X'
      ) = 3
   OR (
          SELECT COUNT(*)
          FROM   tic_Board AS tb
          WHERE  tb.ID_Position IN (1, 4, 7)
                 AND tb.[Letter] = 'X'
      ) = 3
   OR (
          SELECT COUNT(*)
          FROM   tic_Board AS tb
          WHERE  tb.ID_Position IN (2, 5, 8)
                 AND tb.[Letter] = 'X'
      ) = 3
   OR (
          SELECT COUNT(*)
          FROM   tic_Board AS tb
          WHERE  tb.ID_Position IN (3, 6, 9)
                 AND tb.[Letter] = 'X'
      ) = 3
   OR (
          SELECT COUNT(*)
          FROM   tic_Board AS tb
          WHERE  tb.ID_Position IN (1, 5, 9)
                 AND tb.[Letter] = 'X'
      ) = 3
   OR (
          SELECT COUNT(*)
          FROM   tic_Board AS tb
          WHERE  tb.ID_Position IN (3, 5, 7)
                 AND tb.[Letter] = 'X'
      ) = 3
BEGIN
    PRINT 'X wins'
    RETURN
END
    
IF (
       SELECT COUNT(*)
       FROM   tic_Board AS tb
       WHERE  tb.ID_Position IN (1, 2, 3)
              AND tb.[Letter] = 'O'
   ) = 3
   OR (
          SELECT COUNT(*)
          FROM   tic_Board AS tb
          WHERE  tb.ID_Position IN (4, 5, 6)
                 AND tb.[Letter] = 'O'
      ) = 3
   OR (
          SELECT COUNT(*)
          FROM   tic_Board AS tb
          WHERE  tb.ID_Position IN (7, 8, 9)
                 AND tb.[Letter] = 'O'
      ) = 3
   OR (
          SELECT COUNT(*)
          FROM   tic_Board AS tb
          WHERE  tb.ID_Position IN (1, 4, 7)
                 AND tb.[Letter] = 'O'
      ) = 3
   OR (
          SELECT COUNT(*)
          FROM   tic_Board AS tb
          WHERE  tb.ID_Position IN (2, 5, 8)
                 AND tb.[Letter] = 'O'
      ) = 3
   OR (
          SELECT COUNT(*)
          FROM   tic_Board AS tb
          WHERE  tb.ID_Position IN (3, 6, 9)
                 AND tb.[Letter] = 'O'
      ) = 3
   OR (
          SELECT COUNT(*)
          FROM   tic_Board AS tb
          WHERE  tb.ID_Position IN (1, 5, 9)
                 AND tb.[Letter] = 'O'
      ) = 3
   OR (
          SELECT COUNT(*)
          FROM   tic_Board AS tb
          WHERE  tb.ID_Position IN (3, 5, 7)
                 AND tb.[Letter] = 'O'
      ) = 3
BEGIN
    PRINT 'O wins'
    RETURN
END
    
IF (
       SELECT COUNT(*)
       FROM   tic_Board AS tb
       WHERE  tb.[Letter] = ' '
   ) = 0
BEGIN
    PRINT 'It''s a tie'
END
ELSE
	BEGIN
		PRINT 'No result yet'
	END

GO
/****** Object:  StoredProcedure [dbo].[tic_ComputerMove]    Script Date: 01/03/2017 08:39:10 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tic_ComputerMove]
AS

--  Created by: Felipe Maurer
--  Date: Feb 28 2017
--  Purpose: CMake a move for the Computer side, checking the Best Moves table

SET NOCOUNT ON

DECLARE @Hash             INT,
	    @WhosNext         CHAR(1),
	    @BestNextMove     INT
	
SELECT @Hash = SUM(
	        POWER(3, ID_Position - 1) *
	        CASE tb.Letter
	            WHEN ' ' THEN 2
	            WHEN 'O' THEN 1
	            WHEN 'X' THEN 0
	        END
	    )
FROM   tic_Board AS tb
	
SELECT @WhosNext = WhosNext,
	    @BestNextMove     = BestNextMove
FROM   tic_BestMoves
WHERE  id                = @Hash;
	
UPDATE tic_Board
SET    Letter           = @WhosNext
WHERE  ID_Position     = @BestNextMove
	

GO
/****** Object:  StoredProcedure [dbo].[tic_NewBoard]    Script Date: 01/03/2017 08:39:10 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- creates a clean board
CREATE PROCEDURE [dbo].[tic_NewBoard]
AS
--  Created by: Felipe Maurer
--  Date: Feb 28 2017
--  Purpose: Create or clean the Board

SET NOCOUNT ON
	
DELETE tic_Board 
INSERT tic_Board
	(
	ID_Position
	)
VALUES
	(1), (2), (3), (4), (5), (6), (7), (8), (9);


GO
/****** Object:  StoredProcedure [dbo].[tic_PlayerMove]    Script Date: 01/03/2017 08:39:10 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tic_PlayerMove]
	@Position CHAR(2)
AS
--  Created by: Felipe Maurer
--  Date: Feb 28 2017
--  Purpose: Check if the Player move is valid and then make it. Then, make a Computer move.

--  tic_PlayerMove 'a1'
	
IF LEFT(@Position, 1) NOT IN ('a', 'b', 'c')
	OR CAST(RIGHT(@Position, 1) AS INT) NOT BETWEEN 1 AND 3
BEGIN
	PRINT 'The position does not exist'
	RETURN
END
	
SET NOCOUNT ON
	
DECLARE @ID_Position INT
	
SELECT @ID_Position = CASE LEFT(@Position, 1)
	                        WHEN 'a' THEN 0
	                        WHEN 'b' THEN 3
	                        ELSE 6
	                    END + CAST(RIGHT(@Position, 1) AS INT)


IF @ID_Position NOT BETWEEN 1 AND 9
BEGIN
	PRINT 'The position does not exist'
	RETURN
END
	
IF (
	    SELECT tb.Letter
	    FROM   tic_Board AS tb
	    WHERE  tb.ID_Position = @ID_Position
	) <> ' '
BEGIN
	PRINT 'The position is already taken'
	RETURN
END

DECLARE @letter CHAR(1)

IF (SELECT COUNT(*) FROM tic_Board AS tb WHERE tb.Letter <> ' ') = 0
BEGIN
	SELECT @letter = 'X'
END
ELSE
	IF(SELECT COUNT(*) FROM tic_Board AS tb WHERE tb.Letter = 'X') = (SELECT COUNT(*) FROM tic_Board AS tb WHERE tb.Letter = 'O')
	BEGIN
		SELECT @letter = 'X'
	END
	ELSE
		BEGIN
			SELECT @letter = 'O'
		END
	
UPDATE tic_Board
SET    Letter = @letter
WHERE  ID_Position = @ID_Position
	

GO
/****** Object:  StoredProcedure [dbo].[tic_PrintBoard]    Script Date: 01/03/2017 08:39:10 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--- prints out the 
CREATE PROCEDURE [dbo].[tic_PrintBoard]
AS
--  Created by: Felipe Maurer
--  Date: Feb 28 2017
--  Purpose: Print the current Board

SET NOCOUNT ON

DECLARE @Position1     CHAR(1),
	    @Position2     CHAR(1),
	    @Position3     CHAR(1),
	    @Position4     CHAR(1),
	    @Position5     CHAR(1),
	    @Position6     CHAR(1),
	    @Position7     CHAR(1),
	    @Position8     CHAR(1),
	    @Position9     CHAR(1)
	
SELECT @Position1 = Letter
FROM   tic_Board
WHERE  ID_Position = 1
	
SELECT @Position2 = Letter
FROM   tic_Board
WHERE  ID_Position = 2
	
SELECT @Position3 = Letter
FROM   tic_Board
WHERE  ID_Position = 3
	
SELECT @Position4 = Letter
FROM   tic_Board
WHERE  ID_Position = 4
	
SELECT @Position5 = Letter
FROM   tic_Board
WHERE  ID_Position = 5
	
SELECT @Position6 = Letter
FROM   tic_Board
WHERE  ID_Position = 6
	
SELECT @Position7 = Letter
FROM   tic_Board
WHERE  ID_Position = 7
	
SELECT @Position8 = Letter
FROM   tic_Board
WHERE  ID_Position = 8
	
SELECT @Position9 = Letter
FROM   tic_Board
WHERE  ID_Position = 9
	
PRINT '  1|2|3'
PRINT '---------'
PRINT 'A|' + @Position1 + '|' + @Position2 + '|' + @Position3
PRINT '---------'
PRINT 'B|' + @Position4 + '|' + @Position5 + '|' + @Position6
PRINT '---------'
PRINT 'C|' + @Position7 + '|' + @Position8 + '|' + @Position9


GO
/****** Object:  Table [dbo].[tic_BestMoves]    Script Date: 01/03/2017 08:39:10 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tic_BestMoves](
	[id] [smallint] NOT NULL,
	[BestNextMove] [tinyint] NOT NULL,
	[WhosNext] [char](1) NOT NULL DEFAULT ('X'),
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tic_Board]    Script Date: 01/03/2017 08:39:10 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tic_Board](
	[ID_Position] [int] NOT NULL,
	[Letter] [char](1) NOT NULL DEFAULT (' '),
PRIMARY KEY CLUSTERED 
(
	[ID_Position] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (770, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (773, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (779, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (797, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (799, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (805, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (832, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (833, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (835, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (857, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (858, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (861, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (863, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (883, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (885, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (887, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (889, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (890, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (905, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (907, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (913, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (929, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (930, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (933, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (935, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (939, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (941, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (944, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (955, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (957, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (959, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (961, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (962, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (967, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (968, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (970, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (986, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (988, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (989, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (994, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (995, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (997, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1004, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1007, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1025, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1030, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1031, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1033, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1043, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1049, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1051, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1052, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1058, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1060, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1061, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1072, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1073, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1074, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1077, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1079, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1108, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1109, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1110, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1113, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1115, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1125, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1127, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1131, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1138, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1139, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1141, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1144, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1145, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1146, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1149, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1151, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1153, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1155, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1157, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1159, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1160, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1163, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1164, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1167, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1169, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1170, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1179, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1181, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1185, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1189, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1191, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1193, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1195, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1196, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1197, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1199, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1203, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1207, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1208, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1209, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1212, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1214, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1229, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1231, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1237, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1247, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1259, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1265, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1268, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1273, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1283, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1285, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1286, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1291, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1292, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1294, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1300, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1301, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1303, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1315, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1317, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1319, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1321, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1322, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1325, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1326, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1329, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1331, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1341, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1343, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1347, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1351, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1353, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1355, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1357, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1358, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1369, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1370, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1371, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1374, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1376, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1381, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1387, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1389, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1391, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1393, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1394, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1399, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1400, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1402, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1407, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1409, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1412, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1413, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1415, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1419, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1424, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1425, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1428, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1430, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1435, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1436, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1438, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1441, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1442, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1443, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1446, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1448, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1450, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1452, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1454, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1456, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1457, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1499, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1501, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1507, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1553, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1555, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1561, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1576, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1577, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1578, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1581, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1583, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1585, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1587, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1589, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1591, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1592, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1603, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1605, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1607, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1609, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1610, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1615, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1616, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1618, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1657, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1659, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1661, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1663, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1664, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1669, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1670, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1672, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1688, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1690, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1696, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1715, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1717, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1723, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1732, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1733, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1735, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1745, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1751, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1753, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1754, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1759, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1769, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1771, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1772, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1777, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1778, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1780, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1786, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1787, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1789, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1792, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1793, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1794, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1797, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1799, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1801, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1803, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1805, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1807, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1808, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1837, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1839, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1841, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1843, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1844, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1845, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1847, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1851, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1855, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1856, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1857, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1860, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1862, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1867, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1873, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1875, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1877, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1879, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1880, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1885, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1886, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1888, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1891, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1893, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1895, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1897, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1898, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1899, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1901, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1905, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1909, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1910, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1911, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1914, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1916, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1921, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1922, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1924, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1927, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1928, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1929, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1932, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1934, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1936, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1938, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1940, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1942, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1943, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1975, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1985, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1987, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1988, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1993, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1994, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (1996, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2012, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2014, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2020, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2029, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2035, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2037, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2039, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2041, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2042, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2047, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2048, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2050, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2053, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2055, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2057, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2059, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2060, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2061, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2063, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2067, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2071, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2072, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2073, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2076, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2078, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2083, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2084, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2086, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2089, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2090, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2091, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2094, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2096, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2098, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2100, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2102, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2104, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2105, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2120, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2122, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2128, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2137, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2138, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2140, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2143, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2144, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2145, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2148, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2150, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2152, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2154, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2156, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2158, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2159, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2164, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2170, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2172, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2174, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2176, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2177, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2182, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2183, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2185, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2228, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2230, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2231, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2236, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2237, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2239, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2255, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2257, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2263, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2284, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2285, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2293, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2306, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2310, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2314, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2315, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2319, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2321, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2332, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2333, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2337, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2339, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2341, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2347, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2348, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2363, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2365, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2371, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2386, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2387, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2388, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2391, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2393, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2395, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2397, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2399, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2401, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2402, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2413, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2415, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2417, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2419, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2420, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2425, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2426, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2428, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2444, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2446, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2447, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2452, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2453, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2455, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2468, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2476, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2477, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2483, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2494, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2495, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2501, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2503, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2507, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2509, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2510, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2518, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2519, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2522, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2530, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2531, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2537, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2566, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2567, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2571, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2573, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2574, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2583, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2585, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2589, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2596, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2597, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2599, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2602, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2603, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2609, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2611, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2615, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2617, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2618, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2620, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2621, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2622, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2625, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2627, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2628, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2637, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2639, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2643, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2647, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2649, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2651, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2653, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2654, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2655, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2657, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2661, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2665, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2666, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2667, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2670, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2672, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2687, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2689, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2695, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2710, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2711, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2717, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2719, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2723, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2725, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2726, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2737, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2741, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2743, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2744, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2749, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2750, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2752, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2761, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2764, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2765, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2771, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2773, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2779, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2780, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2782, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2783, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2787, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2789, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2790, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2799, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2801, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2805, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2809, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2815, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2816, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2817, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2819, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2823, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2827, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2828, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2832, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2834, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2839, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2845, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2849, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2851, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2852, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2857, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2858, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2860, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2863, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2865, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2867, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2869, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2870, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2871, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2873, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2877, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2881, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2882, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2883, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2886, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2888, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2893, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2894, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2896, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2899, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2900, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2901, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2904, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2906, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2908, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2910, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2912, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2914, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2915, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2954, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2963, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2969, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2980, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2981, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2987, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2989, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2993, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2995, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (2996, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3016, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3017, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3021, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3023, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3042, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3069, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3071, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3075, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3088, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3089, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3090, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3093, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3095, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3097, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3099, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3101, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3103, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3104, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3114, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3123, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3125, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3129, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3141, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3143, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3147, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3151, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3152, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3153, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3156, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3158, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3164, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3166, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3167, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3170, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3178, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3179, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3185, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3188, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3214, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3215, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3221, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3233, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3242, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3246, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3258, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3322, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3323, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3324, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3327, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3329, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3330, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3339, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3341, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3345, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3377, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3381, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3393, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3406, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3407, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3409, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3412, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3413, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3419, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3421, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3425, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3427, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3428, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3431, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3437, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3449, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3457, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3461, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3463, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3464, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3467, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3475, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3476, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3482, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3484, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3485, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3489, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3491, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3501, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3503, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3507, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3539, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3543, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3555, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3565, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3567, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3569, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3571, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3572, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3573, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3575, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3579, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3583, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3584, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3585, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3588, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3590, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3593, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3597, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3609, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3619, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3620, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3621, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3624, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3626, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3627, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3636, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3638, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3642, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3682, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3683, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3689, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3691, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3695, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3697, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3698, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3709, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3713, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3715, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3716, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3721, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3722, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3724, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3736, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3737, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3741, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3743, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3745, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3751, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3752, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3762, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3771, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3773, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3777, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3789, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3791, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3795, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3799, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3800, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3804, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3806, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3817, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3819, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3821, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3823, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3824, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3829, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3830, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3832, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3843, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3845, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3849, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3853, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3854, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3855, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3858, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3860, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3871, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3872, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3873, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3876, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3878, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3880, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3882, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3884, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3886, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3887, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3892, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3893, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3895, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3898, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3899, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3905, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3907, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3911, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3913, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3914, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3916, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3917, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3923, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3935, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3943, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3947, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3949, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3950, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3953, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3961, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3962, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3968, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3970, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3971, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3975, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3977, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3978, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3987, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3989, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (3993, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4025, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4029, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4041, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4051, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4053, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4055, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4057, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4058, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4059, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4061, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4065, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4069, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4070, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4071, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4074, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4076, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4079, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4083, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4095, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4105, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4106, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4107, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4110, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4112, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4113, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4122, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4124, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4128, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4135, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4141, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4145, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4147, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4148, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4153, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4154, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4156, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4159, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4163, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4165, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4166, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4169, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4177, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4178, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4184, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4189, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4190, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4192, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4195, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4196, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4202, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4204, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4208, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4210, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4211, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4213, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4219, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4220, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4221, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4223, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4227, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4231, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4232, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4236, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4238, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4241, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4245, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4257, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4267, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4268, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4272, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4274, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4275, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4284, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4286, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4290, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4297, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4298, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4300, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4303, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4304, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4305, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4308, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4310, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4312, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4314, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4316, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4318, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4319, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4321, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4322, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4323, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4326, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4328, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4329, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4338, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4340, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4344, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4348, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4350, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4352, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4354, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4355, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4356, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4358, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4362, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4366, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4367, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4368, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4371, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4373, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4415, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4417, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4423, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4469, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4471, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4477, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4492, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4493, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4494, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4497, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4499, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4501, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4503, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4505, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4507, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4508, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4519, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4521, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4523, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4525, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4526, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4531, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4532, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4534, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4573, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4575, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4577, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4579, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4580, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4585, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4586, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4588, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4604, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4606, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4612, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4631, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4633, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4639, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4654, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4655, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4661, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4663, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4667, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4669, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4670, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4681, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4685, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4687, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4688, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4693, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4694, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4696, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4702, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4703, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4705, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4708, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4709, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4715, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4717, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4721, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4723, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4724, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4753, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4755, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4757, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4759, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4760, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4761, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4763, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4767, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4771, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4772, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4773, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4776, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4778, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4783, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4789, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4793, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4795, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4796, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4801, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4802, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4804, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4807, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4809, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4811, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4813, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4814, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4815, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4817, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4821, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4825, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4826, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4827, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4830, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4832, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4837, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4838, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4840, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4843, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4844, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4845, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4848, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4850, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4852, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4854, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4856, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4858, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4859, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4897, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4901, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4903, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4904, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4909, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4910, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4912, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4928, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4930, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4936, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4945, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4951, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4955, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4957, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4958, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4963, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4964, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4966, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4969, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4971, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4973, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4975, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4976, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4977, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4979, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4983, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4987, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4988, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4989, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4992, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4994, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (4999, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5000, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5002, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5005, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5006, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5007, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5010, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5012, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5014, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5016, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5018, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5020, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5021, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5036, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5038, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5044, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5053, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5054, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5056, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5059, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5060, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5061, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5064, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5066, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5068, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5070, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5072, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5074, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5075, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5080, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5086, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5088, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5090, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5092, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5093, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5098, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5099, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5101, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5141, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5147, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5153, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5156, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5167, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5171, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5173, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5174, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5179, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5180, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5182, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5203, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5205, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5207, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5209, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5210, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5229, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5231, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5235, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5257, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5258, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5259, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5262, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5264, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5275, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5277, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5279, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5281, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5282, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5287, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5288, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5290, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5301, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5303, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5307, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5312, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5313, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5316, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5318, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5329, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5330, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5331, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5334, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5336, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5338, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5340, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5342, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5344, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5345, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5350, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5351, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5353, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5356, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5357, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5363, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5365, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5369, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5371, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5372, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5375, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5381, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5393, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5401, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5405, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5407, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5408, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5411, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5419, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5420, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5426, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5428, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5429, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5430, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5433, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5435, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5445, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5447, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5451, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5483, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5487, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5499, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5509, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5511, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5513, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5515, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5516, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5517, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5519, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5523, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5527, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5528, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5529, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5532, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5534, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5537, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5541, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5553, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5563, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5564, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5565, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5568, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5570, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5571, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5580, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5582, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5586, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5593, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5599, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5603, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5605, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5606, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5611, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5612, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5614, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5621, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5624, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5627, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5636, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5642, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5647, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5648, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5650, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5653, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5654, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5660, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5662, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5666, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5668, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5669, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5671, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5673, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5675, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5677, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5678, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5689, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5690, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5691, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5694, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5696, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5699, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5703, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5715, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5725, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5726, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5727, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5730, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5732, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5742, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5744, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5748, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5755, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5756, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5758, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5761, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5762, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5763, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5766, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5768, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5770, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5772, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5774, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5776, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5777, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5780, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5781, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5784, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5786, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5787, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5796, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5798, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5802, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5806, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5808, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5810, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5812, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5813, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5814, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5816, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5820, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5824, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5825, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5826, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5829, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5831, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5869, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5873, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5875, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5876, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5881, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5882, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5884, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5900, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5902, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5908, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5923, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5925, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5927, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5929, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5930, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5935, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5936, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5938, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5949, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5951, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5955, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5959, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5960, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5961, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5964, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5966, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5977, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5978, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5979, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5982, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5984, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5986, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5988, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5990, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5992, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (5993, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6008, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6010, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6016, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6031, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6032, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6033, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6036, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6038, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6040, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6042, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6044, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6046, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6047, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6058, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6060, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6062, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6064, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6065, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6070, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6071, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6073, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6079, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6085, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6089, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6091, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6092, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6097, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6098, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6100, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6103, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6107, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6109, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6110, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6113, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6121, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6122, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6128, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6133, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6134, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6136, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6139, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6140, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6146, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6148, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6152, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6154, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6155, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6157, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6159, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6161, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6163, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6164, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6165, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6167, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6171, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6175, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6176, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6177, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6180, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6182, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6211, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6212, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6213, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6216, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6218, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6219, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6228, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6230, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6234, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6241, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6242, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6244, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6247, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6248, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6249, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6252, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6254, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6256, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6258, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6260, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6262, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6263, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6265, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6266, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6267, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6270, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6272, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6273, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6282, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6284, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6288, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6292, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6294, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6296, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6298, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6299, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6300, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6302, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6306, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6310, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6311, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6312, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6315, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6317, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6332, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6334, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6340, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6349, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6350, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6352, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6355, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6356, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6362, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6364, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6368, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6370, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6371, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6376, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6382, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6386, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6388, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6389, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6394, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6395, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6397, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6403, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6404, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6406, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6409, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6410, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6411, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6414, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6416, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6418, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6420, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6422, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6424, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6425, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6427, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6428, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6429, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6432, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6434, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6435, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6444, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6446, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6450, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6454, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6456, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6458, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6460, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6461, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6462, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6464, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6468, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6472, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6473, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6474, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6477, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6479, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6484, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6490, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6492, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6494, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6496, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6497, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6502, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6503, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6505, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6508, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6510, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6512, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6514, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6515, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6516, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6518, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6522, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6526, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6527, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6528, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6531, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6533, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6538, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6539, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6541, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6544, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6545, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6546, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6549, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6551, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6553, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6555, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6557, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6559, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6560, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6602, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6604, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6605, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6610, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6611, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6613, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6629, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6631, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6637, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6656, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6659, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6665, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6674, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6677, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6680, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6684, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6689, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6690, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6693, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6695, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6701, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6707, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6708, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6711, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6713, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6717, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6719, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6722, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6737, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6739, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6745, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6754, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6755, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6757, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6760, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6761, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6762, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6765, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6767, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6769, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6771, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6773, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6775, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6776, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6781, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6787, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6789, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6791, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6793, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6794, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6799, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6800, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6802, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6826, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6827, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6829, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6852, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6855, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6857, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6879, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6881, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6883, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6884, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6890, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6893, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6905, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6911, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6941, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6942, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6945, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6947, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6957, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6959, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6963, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6970, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6971, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6973, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6985, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6989, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6991, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6992, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6994, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6995, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6996, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (6999, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7001, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7011, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7013, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7017, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7021, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7023, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7025, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7027, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7028, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7039, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7040, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7041, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7044, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7046, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7061, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7063, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7069, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7086, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7089, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7091, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7095, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7097, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7099, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7100, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7113, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7115, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7117, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7118, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7123, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7124, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7126, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7133, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7139, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7145, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7151, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7154, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7157, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7158, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7161, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7163, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7164, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7173, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7175, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7179, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7185, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7187, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7190, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7191, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7193, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7197, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7202, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7203, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7206, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7208, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7213, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7219, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7223, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7225, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7226, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7231, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7232, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7234, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7237, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7239, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7241, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7243, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7244, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7245, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7247, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7251, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7255, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7256, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7257, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7260, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7262, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7267, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7268, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7270, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7273, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7274, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7275, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7278, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7280, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7282, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7284, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7286, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7288, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7289, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7322, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7325, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7332, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7338, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7341, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7343, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7348, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7349, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7351, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7356, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7359, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7361, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7365, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7367, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7369, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7370, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7376, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7379, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7391, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7392, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7395, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7397, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7400, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7404, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7416, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7427, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7428, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7431, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7433, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7443, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7445, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7449, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7456, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7457, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7459, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7462, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7463, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7464, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7467, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7469, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7471, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7473, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7475, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7477, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7478, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7481, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7482, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7485, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7487, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7488, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7497, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7499, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7503, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7507, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7509, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7511, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7513, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7514, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7515, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7517, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7521, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7525, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7526, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7527, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7530, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7532, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7538, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7540, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7541, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7554, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7557, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7559, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7566, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7590, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7593, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7595, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7611, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7616, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7620, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7632, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7696, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7697, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7698, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7701, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7703, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7713, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7715, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7719, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7751, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7755, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7767, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7780, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7781, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7783, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7788, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7791, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7793, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7797, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7799, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7801, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7802, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7806, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7809, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7811, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7827, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7833, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7835, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7837, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7838, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7845, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7851, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7854, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7856, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7859, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7860, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7863, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7865, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7875, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7877, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7881, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7913, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7917, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7929, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7939, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7941, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7943, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7945, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7946, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7947, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7949, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7953, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7957, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7958, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7959, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7962, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7964, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7967, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7971, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7983, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7993, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7994, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7995, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (7998, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8000, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8001, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8010, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8012, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8016, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8050, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8051, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8053, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8058, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8061, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8063, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8067, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8069, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8071, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8072, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8077, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8085, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8087, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8089, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8090, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8095, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8096, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8098, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8105, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8111, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8112, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8115, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8117, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8121, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8123, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8126, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8129, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8130, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8133, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8135, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8136, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8145, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8147, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8151, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8157, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8159, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8162, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8163, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8165, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8169, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8174, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8175, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8178, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8180, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8185, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8191, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8193, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8195, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8197, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8198, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8203, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8204, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8206, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8209, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8211, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8213, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8215, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8216, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8217, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8219, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8223, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8227, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8228, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8229, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8232, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8234, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8239, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8240, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8242, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8245, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8246, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8247, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8250, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8252, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8254, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8256, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8258, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8260, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8261, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8266, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8267, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8269, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8283, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8285, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8287, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8288, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8292, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8295, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8297, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8313, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8319, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8321, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8323, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8324, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8337, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8340, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8342, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8345, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8346, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8349, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8351, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8361, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8363, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8367, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8399, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8403, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8415, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8425, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8427, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8429, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8431, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8432, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8443, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8444, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8445, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8448, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8450, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8453, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8457, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8469, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8479, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8480, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8481, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8484, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8486, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8496, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8498, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8502, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8509, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8517, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8519, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8521, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8522, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8527, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8528, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8530, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8535, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8537, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8539, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8540, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8547, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8553, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8556, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8558, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8563, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8564, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8566, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8571, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8574, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8576, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8580, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8582, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8584, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8585, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8589, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8591, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8594, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8595, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8597, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8601, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8606, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8607, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8610, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8612, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8615, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8619, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8631, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8642, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8643, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8646, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8648, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8649, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8658, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8660, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8664, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8671, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8672, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8674, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8677, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8678, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8679, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8682, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8684, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8686, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8688, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8690, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8692, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8693, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8695, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8696, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8697, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8700, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8702, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8703, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8712, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8714, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8718, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8722, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8724, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8726, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8728, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8729, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8730, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8732, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8736, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8740, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8741, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8742, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8745, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8747, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8786, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8790, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8794, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8795, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8796, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8799, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8801, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8812, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8813, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8814, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8817, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8819, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8821, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8823, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8825, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8827, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8828, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8837, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8840, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8849, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8855, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8858, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8862, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8874, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8885, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8889, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8891, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8892, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8901, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8903, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8907, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8914, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8915, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8917, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8920, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8921, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8927, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8929, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8933, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8935, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8936, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8938, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8939, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8940, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8943, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8945, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8946, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8955, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8957, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8961, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8965, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8967, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8969, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8971, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8972, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8973, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8975, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8979, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8983, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8984, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8985, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8988, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (8990, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (9010, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (9011, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (9017, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (9036, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (9063, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (9065, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (9069, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (9074, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (9154, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (9155, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (9161, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (9173, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (9209, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (9213, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (9225, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (9244, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (9245, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (9251, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (9253, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (9257, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (9259, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (9260, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (9270, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (9279, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (9281, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (9285, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (9297, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (9299, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (9303, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (9307, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (9308, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (9309, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (9312, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (9314, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (9317, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (9323, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (9335, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (9371, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (9375, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (9387, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (9397, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (9401, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (9403, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (9404, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (9407, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (9415, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (9416, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (9422, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (9425, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (9429, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (9441, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (9451, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (9452, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (9453, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (9456, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (9458, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (9459, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (9468, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (9470, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (9474, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10234, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10235, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10236, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10239, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10241, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10242, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10251, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10253, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10257, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10261, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10263, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10265, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10267, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10268, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10269, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10271, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10275, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10279, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10280, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10281, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10284, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10286, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10289, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10293, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10295, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10296, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10305, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10307, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10311, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10343, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10347, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10359, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10369, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10371, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10373, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10375, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10376, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10377, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10379, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10383, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10387, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10388, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10389, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10392, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10394, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10397, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10401, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10413, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10423, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10424, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10425, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10428, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10430, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10431, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10440, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10442, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10446, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10450, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10451, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10452, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10455, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10457, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10467, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10469, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10473, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10505, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10509, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10521, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10613, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10617, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10629, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10693, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10695, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10697, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10699, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10700, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10701, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10703, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10707, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10711, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10712, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10713, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10716, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10718, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10721, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10725, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10737, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10747, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10748, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10749, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10752, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10754, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10755, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10764, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10766, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10770, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10775, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10779, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10791, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10855, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10856, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10857, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10860, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10862, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10863, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10872, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10874, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10878, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10910, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10914, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10926, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10972, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10973, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10974, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10977, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10979, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10981, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10983, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10985, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10987, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10988, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (10999, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11001, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11003, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11005, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11006, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11011, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11012, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11014, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11021, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11027, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11033, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11039, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11042, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11045, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11046, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11049, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11051, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11052, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11061, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11063, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11067, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11073, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11075, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11078, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11079, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11081, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11085, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11090, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11091, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11094, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11096, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11101, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11107, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11111, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11113, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11114, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11119, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11120, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11122, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11125, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11127, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11129, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11131, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11132, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11133, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11135, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11139, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11143, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11144, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11145, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11148, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11150, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11155, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11156, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11158, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11161, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11162, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11163, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11166, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11168, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11170, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11172, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11174, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11176, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11177, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11197, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11201, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11203, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11204, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11223, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11225, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11229, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11251, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11252, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11253, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11256, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11258, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11261, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11267, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11279, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11315, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11319, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11331, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11341, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11345, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11347, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11348, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11359, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11360, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11366, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11369, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11373, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11385, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11395, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11396, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11397, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11400, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11402, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11412, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11414, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11418, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11431, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11435, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11437, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11438, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11443, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11444, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11446, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11457, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11459, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11463, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11467, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11468, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11469, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11472, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11474, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11485, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11486, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11487, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11490, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11492, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11494, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11496, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11498, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11500, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11501, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11507, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11510, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11513, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11522, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11528, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11531, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11535, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11547, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11558, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11559, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11562, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11564, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11565, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11574, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11576, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11580, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11587, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11588, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11590, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11593, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11594, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11600, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11602, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11606, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11608, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11609, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11611, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11612, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11613, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11616, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11618, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11619, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11628, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11630, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11634, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11638, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11640, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11642, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11644, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11645, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11646, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11648, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11652, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11656, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11657, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11658, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11661, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11663, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11693, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11694, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11697, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11699, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11700, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11709, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11711, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11715, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11719, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11721, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11723, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11725, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11726, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11727, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11729, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11733, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11737, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11738, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11739, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11742, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11744, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11747, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11748, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11751, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11753, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11763, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11765, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11769, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11801, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11805, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11817, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11827, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11829, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11831, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11833, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11834, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11835, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11837, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11841, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11845, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11846, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11847, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11850, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11852, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11855, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11859, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11871, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11881, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11882, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11883, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11886, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11888, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11889, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11898, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11900, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11904, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11908, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11909, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11910, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11913, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11915, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11925, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11927, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11931, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11963, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11967, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (11979, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12071, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12075, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12087, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12151, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12153, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12155, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12157, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12158, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12159, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12161, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12165, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12169, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12170, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12171, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12174, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12176, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12179, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12183, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12195, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12205, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12206, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12207, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12210, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12212, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12213, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12222, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12224, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12228, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12233, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12237, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12249, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12313, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12314, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12315, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12318, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12320, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12321, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12330, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12332, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12336, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12368, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12372, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12384, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12421, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12423, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12425, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12427, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12428, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12429, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12431, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12435, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12439, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12440, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12441, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12444, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12446, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12451, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12452, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12454, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12457, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12458, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12459, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12462, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12464, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12466, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12468, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12470, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12472, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12473, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12477, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12479, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12482, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12483, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12485, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12489, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12494, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12495, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12498, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12500, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12503, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12507, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12519, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12530, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12531, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12534, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12536, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12537, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12546, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12548, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12552, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12559, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12560, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12562, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12565, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12566, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12567, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12570, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12572, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12574, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12576, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12578, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12580, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12581, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12583, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12584, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12585, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12588, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12590, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12591, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12600, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12602, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12606, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12610, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12612, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12614, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12616, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12617, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12618, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12620, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12624, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12628, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12629, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12630, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12633, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12635, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12637, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12639, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12641, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12643, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12644, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12655, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12656, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12657, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12660, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12662, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12665, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12669, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12681, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12691, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12692, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12693, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12696, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12698, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12708, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12710, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12714, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12719, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12723, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12735, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12799, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12800, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12801, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12804, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12806, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12816, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12818, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12822, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12854, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12858, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12870, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12883, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12884, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12886, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12889, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12890, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12891, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12894, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12896, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12898, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12900, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12902, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12904, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12905, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12907, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12908, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12909, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12912, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12914, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12915, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12924, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12926, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12930, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12934, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12936, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12938, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12940, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12941, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12942, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12944, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12948, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12952, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12953, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12954, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12957, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12959, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12962, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12963, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12966, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12968, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12969, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12978, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12980, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (12984, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13016, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13020, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13032, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13042, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13044, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13046, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13048, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13049, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13050, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13052, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13056, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13060, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13061, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13062, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13065, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13067, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13070, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13074, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13086, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13096, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13097, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13098, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13101, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13103, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13104, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13113, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13115, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13119, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13163, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13165, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13171, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13217, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13219, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13225, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13234, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13235, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13237, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13240, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13241, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13242, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13245, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13247, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13249, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13251, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13253, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13255, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13256, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13261, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13267, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13269, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13271, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13273, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13274, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13279, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13280, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13282, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13315, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13321, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13323, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13325, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13327, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13328, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13333, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13334, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13336, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13352, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13354, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13360, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13379, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13381, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13387, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13404, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13407, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13409, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13413, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13415, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13417, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13418, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13431, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13433, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13435, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13436, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13441, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13442, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13444, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13450, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13451, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13453, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13456, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13457, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13463, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13465, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13469, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13471, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13472, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13501, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13503, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13505, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13507, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13508, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13509, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13511, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13515, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13519, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13520, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13521, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13524, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13526, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13531, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13537, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13541, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13543, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13544, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13549, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13550, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13552, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13555, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13557, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13559, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13561, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13562, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13563, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13565, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13569, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13573, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13574, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13575, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13578, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13580, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13585, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13586, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13588, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13591, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13592, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13593, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13596, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13598, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13600, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13602, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13604, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13606, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13607, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13647, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13649, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13651, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13652, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13657, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13658, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13660, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13676, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13678, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13684, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13693, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13699, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13703, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13705, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13706, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13711, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13712, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13714, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13717, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13719, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13721, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13723, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13724, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13725, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13727, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13731, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13735, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13736, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13737, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13740, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13742, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13747, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13748, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13750, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13753, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13754, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13755, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13758, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13760, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13762, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13764, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13766, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13768, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13769, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13784, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13786, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13792, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13801, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13802, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13804, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13807, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13808, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13809, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13812, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13814, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13816, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13818, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13820, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13822, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13823, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13828, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13834, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13836, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13838, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13840, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13841, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13846, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13847, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13849, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13883, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13890, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13893, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13895, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13899, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13901, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13904, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13909, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13917, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13919, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13921, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13922, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13927, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13928, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13930, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13936, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13937, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13939, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13951, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13953, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13955, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13957, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13958, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13961, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13962, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13965, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13967, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13977, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13979, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13983, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13987, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13989, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13991, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13993, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (13994, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14005, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14006, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14007, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14010, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14012, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14017, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14023, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14025, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14027, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14029, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14030, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14035, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14036, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14038, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14043, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14045, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14048, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14049, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14051, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14055, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14060, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14061, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14064, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14066, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14071, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14072, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14074, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14077, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14078, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14079, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14082, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14084, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14086, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14088, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14090, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14092, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14093, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14098, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14099, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14101, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14106, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14109, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14111, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14115, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14117, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14119, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14120, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14124, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14127, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14129, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14145, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14151, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14153, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14155, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14156, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14163, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14169, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14172, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14174, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14176, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14177, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14178, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14181, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14183, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14193, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14195, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14199, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14231, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14235, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14247, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14257, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14259, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14261, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14263, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14264, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14265, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14267, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14271, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14275, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14276, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14277, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14280, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14282, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14285, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14289, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14301, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14311, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14312, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14313, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14316, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14318, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14319, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14328, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14330, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14334, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14341, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14349, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14351, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14353, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14354, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14359, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14360, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14362, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14367, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14369, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14372, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14379, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14385, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14388, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14390, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14395, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14396, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14398, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14403, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14406, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14408, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14412, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14414, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14416, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14417, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14419, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14421, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14423, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14425, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14426, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14437, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14438, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14439, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14442, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14444, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14447, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14451, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14463, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14473, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14474, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14475, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14478, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14480, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14490, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14492, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14496, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14503, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14504, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14506, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14509, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14510, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14511, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14514, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14516, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14518, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14520, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14522, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14524, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14525, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14528, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14529, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14532, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14534, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14535, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14544, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14546, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14550, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14554, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14556, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14558, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14560, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14561, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14562, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14564, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14568, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14572, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14573, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14574, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14577, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14579, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14611, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14619, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14621, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14623, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14624, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14629, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14630, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14632, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14648, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14650, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14656, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14665, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14671, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14673, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14675, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14677, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14678, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14683, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14684, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14686, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14689, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14691, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14693, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14695, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14696, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14697, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14699, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14703, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14707, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14708, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14709, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14712, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14714, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14719, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14720, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14722, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14725, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14726, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14727, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14730, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14732, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14734, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14736, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14738, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14740, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14741, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14756, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14758, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14764, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14773, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14774, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14776, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14779, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14780, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14781, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14784, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14786, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14788, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14790, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14792, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14794, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14795, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14800, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14806, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14808, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14810, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14812, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14813, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14818, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14819, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14821, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14827, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14835, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14837, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14839, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14840, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14845, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14846, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14848, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14853, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14855, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14857, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14858, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14865, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14871, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14874, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14876, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14881, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14882, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14884, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14889, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14892, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14894, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14898, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14900, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14902, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14903, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14905, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14907, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14909, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14911, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14912, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14913, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14915, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14919, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14923, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14924, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14925, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14928, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14930, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14959, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14960, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14961, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14964, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14966, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14967, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14976, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14978, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14982, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14989, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14990, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14992, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14995, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14996, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (14997, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15000, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15002, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15004, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15006, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15008, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15010, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15011, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15013, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15014, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15015, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15018, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15020, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15021, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15030, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15032, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15036, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15040, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15042, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15044, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15046, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15047, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15048, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15050, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15054, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15058, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15059, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15060, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15063, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15065, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15080, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15082, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15088, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15097, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15098, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15100, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15105, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15108, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15110, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15114, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15116, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15118, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15119, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15124, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15132, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15134, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15136, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15137, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15142, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15143, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15145, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15151, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15152, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15154, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15157, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15158, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15159, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15162, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15164, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15166, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15168, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15170, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15172, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15173, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15175, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15176, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15177, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15180, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15182, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15183, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15192, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15194, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15198, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15202, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15204, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15206, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15208, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15209, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15210, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15212, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15216, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15220, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15221, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15222, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15225, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15227, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15232, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15238, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15240, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15242, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15244, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15245, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15250, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15251, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15253, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15256, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15258, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15260, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15262, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15263, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15264, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15266, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15270, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15274, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15275, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15276, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15279, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15281, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15286, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15287, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15289, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15292, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15293, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15294, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15297, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15299, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15301, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15303, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15305, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15307, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15308, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15346, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15347, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15348, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15351, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15353, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15355, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15357, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15359, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15361, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15362, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15373, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15375, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15377, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15379, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15380, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15385, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15386, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15388, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15397, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15400, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15401, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15407, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15409, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15415, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15416, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15418, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15419, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15423, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15425, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15426, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15435, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15437, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15441, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15445, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15451, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15452, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15453, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15455, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15459, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15463, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15464, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15468, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15470, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15475, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15481, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15485, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15487, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15488, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15493, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15494, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15496, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15499, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15501, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15503, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15505, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15506, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15507, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15509, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15513, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15517, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15518, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15519, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15522, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15524, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15529, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15530, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15532, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15535, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15536, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15537, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15540, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15542, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15544, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15546, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15548, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15550, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15551, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15562, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15563, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15569, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15571, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15575, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15577, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15578, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15588, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15597, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15599, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15603, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15615, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15617, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15621, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15625, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15626, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15627, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15630, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15632, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15634, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15635, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15641, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15653, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15689, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15693, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15705, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15715, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15719, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15721, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15722, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15725, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15733, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15734, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15740, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15743, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15747, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15759, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15769, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15770, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15771, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15774, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15776, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15777, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15786, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15788, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15792, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15805, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15809, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15811, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15812, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15817, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15818, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15820, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15831, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15833, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15837, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15841, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15842, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15843, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15846, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15848, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15859, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15860, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15861, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15864, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15866, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15868, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15870, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15872, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15874, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15875, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15877, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15883, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15884, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15887, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15895, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15896, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15902, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15905, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15909, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15921, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15931, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15932, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15936, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15938, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15939, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15948, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15950, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15954, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15961, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15962, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15964, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15967, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15968, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15974, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15976, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15980, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15982, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15983, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15985, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15986, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15987, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15990, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15992, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (15993, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16002, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16004, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16008, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16012, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16014, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16016, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16018, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16019, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16020, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16022, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16026, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16030, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16031, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16032, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16035, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16037, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16067, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16068, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16071, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16073, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16074, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16083, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16085, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16089, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16093, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16095, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16097, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16099, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16100, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16101, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16103, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16107, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16111, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16112, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16113, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16116, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16118, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16120, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16121, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16125, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16127, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16137, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16139, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16143, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16175, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16179, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16191, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16201, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16203, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16205, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16207, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16208, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16209, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16211, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16215, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16219, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16220, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16221, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16224, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16226, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16229, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16233, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16245, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16255, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16256, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16257, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16260, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16262, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16263, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16272, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16274, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16278, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16282, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16283, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16284, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16287, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16289, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16290, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16299, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16301, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16305, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16337, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16341, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16353, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16445, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16449, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16461, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16525, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16527, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16529, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16531, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16532, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16533, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16535, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16539, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16543, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16544, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16545, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16548, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16550, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16553, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16557, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16569, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16579, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16580, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16581, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16584, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16586, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16587, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16596, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16598, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16602, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16607, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16611, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16623, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16687, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16688, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16689, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16692, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16694, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16695, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16704, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16706, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16710, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16742, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16746, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16758, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16795, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16797, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16799, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16801, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16802, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16803, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16805, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16809, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16813, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16814, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16815, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16818, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16820, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16825, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16826, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16828, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16831, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16832, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16833, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16836, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16838, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16840, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16842, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16844, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16846, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16847, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16849, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16855, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16856, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16857, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16859, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16863, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16867, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16868, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16872, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16874, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16877, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16881, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16893, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16903, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16904, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16908, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16910, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16911, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16920, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16922, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16926, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16933, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16934, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16936, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16939, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16940, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16941, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16944, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16946, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16948, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16950, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16952, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16954, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16955, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16957, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16958, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16959, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16962, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16964, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16965, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16974, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16976, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16980, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16984, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16986, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16988, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16990, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16991, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16992, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16994, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (16998, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17002, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17003, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17004, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17007, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17009, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17011, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17013, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17015, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17017, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17018, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17019, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17021, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17025, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17029, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17030, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17031, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17034, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17036, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17039, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17043, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17055, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17065, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17066, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17067, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17070, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17072, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17073, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17082, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17084, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17088, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17093, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17097, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17109, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17173, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17174, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17175, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17178, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17180, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17181, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17190, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17192, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17196, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17228, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17232, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17244, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17257, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17258, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17260, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17263, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17264, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17265, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17268, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17270, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17272, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17274, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17276, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17278, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17279, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17281, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17282, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17283, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17286, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17288, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17289, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17298, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17300, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17304, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17308, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17310, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17312, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17314, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17315, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17316, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17318, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17322, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17326, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17327, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17328, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17331, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17333, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17335, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17336, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17340, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17342, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17343, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17352, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17354, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17358, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17390, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17394, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17406, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17416, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17418, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17420, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17422, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17423, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17424, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17426, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17430, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17434, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17435, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17436, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17439, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17441, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17444, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17448, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17460, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17470, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17471, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17472, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17475, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17477, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17478, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17487, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17489, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17493, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17533, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17535, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17537, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17539, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17540, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17545, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17546, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17548, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17564, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17566, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17572, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17581, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17587, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17591, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17593, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17594, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17599, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17600, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17602, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17605, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17607, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17609, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17611, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17612, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17613, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17615, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17619, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17623, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17624, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17625, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17628, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17630, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17635, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17636, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17638, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17641, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17642, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17643, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17646, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17648, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17650, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17652, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17654, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17656, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17657, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17672, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17674, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17680, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17689, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17690, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17692, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17695, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17696, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17697, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17700, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17702, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17704, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17706, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17708, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17710, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17711, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17716, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17722, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17724, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17726, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17728, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17729, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17734, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17735, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17737, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17749, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17753, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17755, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17756, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17761, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17762, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17764, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17775, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17777, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17781, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17785, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17786, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17787, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17790, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17792, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17803, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17804, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17805, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17808, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17810, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17812, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17814, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17816, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17818, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17819, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17821, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17825, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17827, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17828, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17831, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17839, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17840, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17846, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17875, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17876, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17877, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17880, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17882, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17883, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17892, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17894, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17898, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17905, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17906, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17908, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17911, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17912, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17918, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17920, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17924, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17926, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17927, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17929, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17930, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17931, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17934, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17936, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17937, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17946, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17948, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17952, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17956, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17958, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17960, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17962, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17963, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17964, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17966, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17970, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17974, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17975, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17976, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17979, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17981, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17996, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (17998, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18004, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18019, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18020, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18021, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18024, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18026, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18028, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18030, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18032, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18034, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18035, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18046, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18048, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18050, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18052, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18053, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18058, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18059, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18061, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18067, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18068, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18070, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18073, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18074, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18080, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18082, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18086, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18088, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18089, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18091, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18092, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18093, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18096, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18098, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18099, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18108, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18110, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18114, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18118, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18120, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18122, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18124, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18125, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18126, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18128, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18132, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18136, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18137, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18138, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18141, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18143, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18148, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18154, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18158, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18160, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18161, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18166, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18167, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18169, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18172, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18174, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18176, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18178, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18179, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18180, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18182, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18186, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18190, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18191, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18192, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18195, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18197, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18202, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18203, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18205, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18208, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18209, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18210, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18213, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18215, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18217, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18219, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18221, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18223, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18224, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18255, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18257, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18260, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18261, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18263, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18267, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18272, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18273, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18276, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18278, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18283, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18284, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18286, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18289, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18290, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18291, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18294, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18296, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18298, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18300, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18302, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18304, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18305, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18307, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18309, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18311, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18313, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18314, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18325, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18326, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18327, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18330, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18332, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18335, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18339, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18351, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18361, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18362, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18363, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18366, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18368, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18378, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18380, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18384, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18391, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18392, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18394, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18397, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18398, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18399, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18402, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18404, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18406, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18408, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18410, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18412, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18413, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18416, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18417, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18420, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18422, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18423, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18432, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18434, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18438, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18442, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18444, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18446, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18448, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18449, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18450, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18452, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18456, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18460, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18461, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18462, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18465, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18467, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18469, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18471, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18473, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18475, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18476, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18477, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18479, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18483, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18487, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18488, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18489, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18492, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18494, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18497, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18501, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18513, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18523, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18524, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18525, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18528, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18530, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18531, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18540, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18542, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18546, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18551, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18555, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18567, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18631, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18632, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18633, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18636, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18638, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18639, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18648, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18650, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18654, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18686, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18690, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18702, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18715, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18716, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18718, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18721, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18722, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18723, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18726, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18728, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18730, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18732, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18734, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18736, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18737, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18740, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18741, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18744, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18746, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18747, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18756, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18758, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18762, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18766, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18768, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18770, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18772, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18773, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18774, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18776, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18780, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18784, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18785, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18786, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18789, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18791, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18793, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18794, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18795, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18798, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18800, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18810, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18812, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18816, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18848, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18852, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18864, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18874, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18876, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18878, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18880, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18881, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18882, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18884, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18888, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18892, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18893, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18894, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18897, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18899, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18902, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18906, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18918, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18928, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18929, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18930, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18933, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18935, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18936, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18945, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18947, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18951, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18985, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18986, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18988, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18991, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18992, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18993, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18996, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (18998, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19000, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19002, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19004, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19006, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19007, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19012, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19018, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19020, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19022, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19024, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19025, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19030, 4, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19031, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19033, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19039, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19040, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19042, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19045, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19046, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19047, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19050, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19052, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19054, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19056, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19058, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19060, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19061, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19063, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19064, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19065, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19068, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19070, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19071, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19080, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19082, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19086, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19090, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19092, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19094, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19096, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19097, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19098, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19100, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19104, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19108, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19109, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19110, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19113, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19115, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19120, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19126, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19128, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19130, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19132, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19133, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19138, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19139, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19141, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19144, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19146, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19148, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19150, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19151, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19152, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19154, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19158, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19162, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19163, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19164, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19167, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19169, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19174, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19175, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19177, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19180, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19181, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19182, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19185, 4, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19187, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19189, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19191, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19193, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19195, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19196, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19201, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19202, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19204, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19207, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19208, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19209, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19212, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19214, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19216, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19218, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19220, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19222, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19223, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19225, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19226, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19227, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19230, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19232, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19233, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19242, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19244, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19248, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19252, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19254, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19256, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19258, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19259, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19260, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19262, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19266, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19270, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19271, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19272, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19275, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19277, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19279, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19280, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19281, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19284, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19286, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19287, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19296, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19298, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19302, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19334, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19338, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19350, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19360, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19362, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19364, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19366, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19367, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19368, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19370, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19374, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19378, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19379, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19380, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19383, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19385, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19388, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19392, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19404, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19414, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19415, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19416, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19419, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19421, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19422, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19431, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19433, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19437, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19444, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19450, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19452, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19454, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19456, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19457, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19462, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19463, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19465, 6, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19468, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19470, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19472, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19474, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19475, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19476, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19478, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19482, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19486, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19487, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19488, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19491, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19493, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19498, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19499, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19501, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19504, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19505, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19506, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19509, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19511, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19513, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19515, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19517, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19519, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19520, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19522, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19524, 8, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19526, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19528, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19529, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19530, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19532, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19536, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19540, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19541, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19542, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19545, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19547, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19550, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19554, 2, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19566, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19576, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19577, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19578, 8, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19581, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19583, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19584, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19593, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19595, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19599, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19606, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19607, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19609, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19612, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19613, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19614, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19617, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19619, 6, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19621, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19623, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19625, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19627, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19628, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19630, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19631, 1, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19632, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19635, 2, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19637, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19638, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19647, 3, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19649, 1, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19653, 3, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19657, 7, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19659, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19661, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19663, 9, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19664, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19665, 9, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19667, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19671, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19675, 5, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19676, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19677, 7, N'X')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19680, 5, N'O')
GO
INSERT [dbo].[tic_BestMoves] ([id], [BestNextMove], [WhosNext]) VALUES (19682, 1, N'X')
GO
INSERT [dbo].[tic_Board] ([ID_Position], [Letter]) VALUES (1, N' ')
GO
INSERT [dbo].[tic_Board] ([ID_Position], [Letter]) VALUES (2, N' ')
GO
INSERT [dbo].[tic_Board] ([ID_Position], [Letter]) VALUES (3, N'X')
GO
INSERT [dbo].[tic_Board] ([ID_Position], [Letter]) VALUES (4, N' ')
GO
INSERT [dbo].[tic_Board] ([ID_Position], [Letter]) VALUES (5, N' ')
GO
INSERT [dbo].[tic_Board] ([ID_Position], [Letter]) VALUES (6, N'O')
GO
INSERT [dbo].[tic_Board] ([ID_Position], [Letter]) VALUES (7, N' ')
GO
INSERT [dbo].[tic_Board] ([ID_Position], [Letter]) VALUES (8, N'O')
GO
INSERT [dbo].[tic_Board] ([ID_Position], [Letter]) VALUES (9, N'X')
GO
ALTER TABLE [dbo].[tic_Board]  WITH CHECK ADD CHECK  (([ID_Position]>=(1) AND [ID_Position]<=(9)))
GO
ALTER TABLE [dbo].[tic_Board]  WITH CHECK ADD CHECK  (([Letter]=' ' OR [Letter]='O' OR [Letter]='X'))
GO
ALTER DATABASE [TicTacToe] SET  READ_WRITE 
GO
GRANT EXECUTE ON tic_PrintBoard TO player
GO
GRANT EXECUTE ON tic_CheckEndGame TO player
GO
GRANT EXECUTE ON tic_ComputerMove TO player
GO
GRANT EXECUTE ON tic_NewBoard TO player
GO
GRANT EXECUTE ON tic_PlayerMove TO player
GO
GRANT EXECUTE ON tic_PrintBoard TO player
GO
USE [master]
GO
ALTER DATABASE [TicTacToe] SET  READ_WRITE 
GO
