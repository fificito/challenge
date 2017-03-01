del Command.sql
Echo exec TicTacToe.dbo.tic_PlayerMove '%1' > Command.sql
Echo exec TicTacToe.dbo.tic_PrintBoard >> Command.sql
echo exec TicTacToe.dbo.tic_CheckEndGame >> Command.sql
CALL Command.bat