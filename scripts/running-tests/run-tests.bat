@echo off
call C:\course\.venv\Scripts\activate.bat
cd C:\course\scripts\running-tests
call robot display-message.robot
call C:\course\.venv\Scripts\deactivate.bat