# Natural Language Processing Project - Automated Fact-Checking System

**Short guide for this project**

The submission zip file would be contain the following elements:

- **Main Code File** // An ipynb file contains our implementation of the Automated Fact-Checking System.
- **Evaluation Script**// An evluation script provided in COMP90042_2024 repository: https://github.com/drcarenhan/COMP90042_2024?tab=readme-ov-file#-3-testing-and-evaluation
- **Shell Scripts** // The shell scripts to run the code are contained in the `scripts` folder.
- **Project Environment and Requirement File** // The conda `environment.yml` file and the pip `requirements.txt` file to help set up code running environment.

--------------------------------------------------------------------------------------------------------------------------------------------------------------

## Table of Contents

- [Our Team](#our-team)
- [Project Overview](#project-overview)
- [Dataset](#dataset)
- [Requirements & Environment](#requirements--environment)
    - [Pip installation](#pip-installation)
    - [Using the exported Conda environment](#using-the-exported-conda-environment)
- [Evaluation](#evaluation)
    - [Evaluate the model](#evaluate-the-model)
- [Shell Script Usage](#shell-script-usage)

--------------------------------------------------------------------------------------------------------------------------------------------------------------

## Authors

This project was developed by the COMP90042 Natural Language Processing Project - Mon5PM Group at the University of Melbourne:

- **[Wenda Zhang](https://github.com/WendaZhang08)**

  - 🆔 Student ID: 1126164
  - 📧 Email: [wendaz@student.unimelb.edu.au](mailto:wendaz@student.unimelb.edu.au)

- **[Shanqing Huang](https://github.com/shanqingh)**

  - 🆔 Student ID: 1266301
  - 📧 Email: [shanqingh@student.unimelb.edu.au](mailto:shanqingh@student.unimelb.edu.au)

- **[Yilin Chen](https://github.com/6188145)**

  - 🆔 Student ID: 1239841
  - 📧 Email: [yilinc6@student.unimelb.edu.au](mailto:yilinc6@student.unimelb.edu.au)

--------------------------------------------------------------------------------------------------------------------------------------------------------------

## Project Overview

The goal of this project is to develop an automated fact-checking system that, given a claim, can:

1. Retrieve the most relevant evidence passages from a provided knowledge source.

2. Classify the claim into one of four categories: **SUPPORTS**, **REFUTES**, **NOT_ENOUGH_INFO**, **DISPUTED**.

The system is implemented using deep learning techniques, specifically focusing on the **LSTM** architectures.

--------------------------------------------------------------------------------------------------------------------------------------------------------------

## Dataset

The project uses the following dataset files in `data` folders:

- `train-claims.json`: Labelled training set.
- `dev-claims.json`: Labelled development set.
- `test-claims-unlabelled.json`: Unlabelled test set.
- `evidence.json`: Knowledge source containing evidence passages.
- `dev-claims-baseline.json`: Baseline system predictions on the development set.
- `eval.py`: Evaluation script to compute performance metrics.

**Note**: The code running require place the dataset files (`train-claims.json`, `dev-claims.json`, `test-claims-unlabelled.json`, `evidence.json`) in the `data` directory.

--------------------------------------------------------------------------------------------------------------------------------------------------------------

## Requirements & Environment

The code is implemented in **Python** and requires the following libraries to be installed:

- PyTorch
- NumPy
- NLTK
- Scikit-learn


### Pip installation

The `requirements.txt` have been provided to help install the required libraries, run:

```
pip install -r requirements.txt
```

### Using the exported Conda environment

If you are using **Conda** to manage your environment, the `environment.yml` have been provided to create the necessary environment for the project, run:

```
conda env create -f environment.yml
```

--------------------------------------------------------------------------------------------------------------------------------------------------------------

## Evaluation

The system's performance is evaluated using three metrics:

- Evidence Retrieval F-score
- Claim Classification Accuracy
- Harmonic Mean of F-score and Accuracy

The evaluation script `eval.py` computes these metrics given the ground truth and predicted labels.

### Evaluate the model

To evaluate the model on the development set, run:

```
python eval.py --predictions data/dev_predict.json --groundtruth data/dev-claims.json
```

**Note**: The evaluatation of model on the development set need (`dev_predict.json`, `dev-claims.json`) in the `data` directory.

--------------------------------------------------------------------------------------------------------------------------------------------------------------

## Shell Script Usage

Colab, Windows and macOS shell scripts have also been provided in the `scripts` folder. It has hard-coded to install the required packages and run the `Mon5PMGroup7_COMP90042_Project_2024.ipynb`. It will also generate a file named `'project_output.ipynb` in the `output` folder with all the code blocks' output of our main code. Furthermore, the shell scripts will also generate a `Testing_Evaluation_Result.txt` based on the `eval.py` in the `output` folder.

**Note**: The shell scripts require place the dataset files (`train-claims.json`, `dev-claims.json`, `test-claims-unlabelled.json`, `evidence.json`) in the `data` directory. The shell scripts' performance varies on different machines and platforms.

---

## Contributing

Contributions are welcome! Please follow these steps to contribute:

1. **Fork the Repository**.
2. **Create a New Branch**:
   - `git checkout -b feature/YourFeatureName`
3. **Commit Your Changes**:
   - `git commit -m "Add some feature"`
4. **Push to the Branch**:
   - `git push origin feature/YourFeatureName`
5. **Open a Pull Request**.

Please ensure your code follows the project's coding standards and includes appropriate comments and documentation.

---

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

*Last updated: December 2024*
