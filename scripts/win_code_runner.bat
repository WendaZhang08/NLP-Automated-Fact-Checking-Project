@echo off
setlocal enabledelayedexpansion

:: Save the current directory
set ORIGINAL_DIR=%CD%

:: Change directory to where the Project code file and data files are located
cd ../

:: Check if Python is installed
python --version >nul 2>&1
if %ERRORLEVEL% neq 0 (
    echo Python is not installed. Please install Python before running this script.
    pause
    exit /b
)

:: Check if pip is installed
python -m pip --version >nul 2>&1
if %ERRORLEVEL% neq 0 (
    echo pip is not installed. Installing pip...
    python -m ensurepip
)

:: Check if papermill is installed
python -m pip show papermill >nul 2>&1
if %ERRORLEVEL% neq 0 (
    echo papermill is not installed. Installing...
    python -m pip install papermill
)

:: Check if required Python packages are installed
echo Installing required Python packages...
python -m pip install numpy nltk scikit-learn keras tensorflow

:: Execute the Project Code File
echo Executing the Project Code File...
papermill GroupID__COMP90042_Project_2024.ipynb outputs/project_output.ipynb

if %ERRORLEVEL% neq 0 (
    echo Failed to execute Jupyter Notebook.
    pause
    exit /b
)

:: Run the evaluation script
echo Running evaluation script and saving output...
python eval.py --predictions data/dev_predict.json --groundtruth data/dev-claims.json > outputs/Testing_Evaluation_Result.txt

:: Show the result
echo Showing output...
type "outputs\Testing_Evaluation_Result.txt"

echo Script finished!
pause

:: Return to the original directory
cd %ORIGINAL_DIR%