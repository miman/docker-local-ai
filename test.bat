@echo off

@REM set my_variable=(`docker network inspect local-ai-network`)
@REM echo The output is: %my_variable%

FOR /F "tokens=* USEBACKQ" %%F IN (`docker network inspect local-ai-network`) DO (
    SET my_variable=%%F
)
ECHO %my_variable%