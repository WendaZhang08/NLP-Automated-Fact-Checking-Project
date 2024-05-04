# Importing required modules
import sys
import subprocess
import os

# Check environment variables to prevent recursive execution
if os.getenv('IS_RUNNING') == 'yes':
    print("Detected recursion. Exiting script to prevent re-execution.")
    exit()

# Set environment variable
os.environ['IS_RUNNING'] = 'yes'

# Save the current directory
original_dir = os.getcwd()

# Change directory to where the Project code file and data files are located
os.chdir('../')

# Function to run shell commands
def run_command(command):
    result = subprocess.run(command, shell=True, text=True, capture_output=True)
    if result.returncode != 0:
        print(f"Command failed: {command}\n{result.stderr}")
    else:
        print(f"Command succeeded: {command}\n{result.stdout}")
    return result


# Check Python and pip version
print("Python version:", sys.version)
run_command("pip --version")

# Install papermill if it's not installed
run_command("pip show papermill || pip install papermill")

# Install required Python packages
required_packages = ["numpy", "nltk", "scikit-learn", "keras", "tensorflow"]
run_command(f"pip install {' '.join(required_packages)}")

# Execute the Jupyter Notebook using papermill
input_notebook = 'GroupID__COMP90042_Project_2024.ipynb'
output_notebook = 'outputs/project_output.ipynb'
if os.path.exists(output_notebook):
    os.remove(output_notebook)

run_command(f"papermill {input_notebook} {output_notebook}")

# Assuming eval.py and necessary data files are in the environment
# Run the evaluation script and print the result
evaluation_command = "python eval.py --predictions data/dev_predict.json --groundtruth data/dev-claims.json"
result = run_command(evaluation_command)
print("Evaluation result:")
print(result.stdout)

# Save the output to a text file if needed
output_file_path = 'outputs/Testing_Evaluation_Result.txt'
if not os.path.exists(output_file_path):
    with open(output_file_path, 'w') as file:
        file.write(result.stdout)
else:
    print(f"File {output_file_path} already exists. Skipping write operation.")
    
print("Script finished!")

# Return to the original directory
os.chdir(original_dir)
