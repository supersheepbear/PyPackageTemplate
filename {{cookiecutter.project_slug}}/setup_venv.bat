@echo on
echo Starting setup_venv.bat script...

echo Checking for existing virtual environment...
if exist .venv (
    echo A virtual environment already exists in the .venv directory.
    echo If you want to recreate it, please delete the .venv directory first.
    goto :eof
)

echo Creating virtual environment...
{{ cookiecutter.python_path }} -m venv .venv
if %errorlevel% neq 0 (
    echo Failed to create virtual environment. Error level: %errorlevel%
    goto :eof
)

echo Virtual environment created successfully.
echo Activating virtual environment...
call .venv\Scripts\activate.bat
if %errorlevel% neq 0 (
    echo Failed to activate virtual environment. Error level: %errorlevel%
    goto :eof
)

echo Virtual environment activated. You can now install dependencies.
pause

echo Upgrading pip and setuptools...
python -m pip install --upgrade pip setuptools
if %errorlevel% neq 0 (
    echo Failed to upgrade pip and setuptools. Error level: %errorlevel%
    goto :eof
)

echo Installing dependencies...
python -m pip install -r requirements_dev.txt
if %errorlevel% neq 0 (
    echo Failed to install dependencies. Error level: %errorlevel%
    goto :eof
)

echo Virtual environment setup complete!
echo To activate the virtual environment, run: .venv\Scripts\activate.bat

:eof
echo Script execution completed.
pause