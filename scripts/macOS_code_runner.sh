#!/bin/bash

# Save the current directory
ORIGINAL_DIR=$(pwd)

# Change directory to where the Project code file and data files are located
cd ../

# Check if Python is installed
if ! python --version &> /dev/null; then
    echo "Python is not installed. Please install Python before running this script."
    read -p "Press any key to continue..." -n 1 -r
    exit 1
fi

# Check if pip is installed
if ! python -m pip --version &> /dev/null; then
    echo "pip is not installed. Installing pip..."
    python -m ensurepip
fi

# Check if papermill is installed
if ! python -m pip show papermill &> /dev/null; then
    echo "papermill is not installed. Installing..."
    python -m pip install papermill
fi

# Check if required Python packages are installed
echo "Installing required Python packages..."
python -m pip install numpy nltk scikit-learn keras tensorflow

# Execute the Project Code File
echo "Executing the Project Code File..."
if ! papermill GroupID__COMP90042_Project_2024.ipynb outputs/project_output.ipynb; then
    echo "Failed to execute Jupyter Notebook."
    read -p "Press any key to continue..." -n 1 -r
    exit 1
fi

# Run the evaluation script
echo "Running evaluation script and saving output..."
python eval.py --predictions data/dev_predict.json --groundtruth data/dev-claims.json > outputs/Testing_Evaluation_Result.txt

# Show the result
echo "Showing output..."
cat "outputs/Testing_Evaluation_Result.txt"

echo "Script finished!"
read -p "Press any key to continue..." -n 1 -r

# Return to the original directory
cd "$ORIGINAL_DIR"
