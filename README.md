# RBP-Spark: Scalable RNA-Binding Protein Prediction Framework
## 📌 Overview
RBP-Spark is a scalable machine learning framework for RNA-binding protein (RBP) prediction. It integrates hybrid sequence-derived feature representations with classical machine learning and a distributed Apache Spark architecture to enable efficient large-scale protein sequence analysis.

### The framework combines:
Hybrid biological feature extraction
Class imbalance handling (SMOTE-ENN)
Dimensionality reduction (PCA)
Support Vector Machine (SVM) classification
Distributed computing using Apache Spark
## 📊 Dataset

The framework uses a publicly available benchmark dataset originally introduced in RBPro-RF.

### Dataset composition:
Training set: 9,873 protein sequences
Independent test sets:
Human
Saccharomyces cerevisiae
Arabidopsis thaliana
### Classes:
RNA-binding proteins (RBP)
Non-RNA-binding proteins (non-RBP)
### Preprocessing:
Redundancy reduction (CD-HIT-based in original dataset construction)
Standardized feature extraction pipeline applied consistently across all experiments
# ⚙️ Methodology Pipeline

The complete workflow includes:

Input protein sequences
### Feature Extraction
DDE
GDPC
CTDC
KSCTriad
PseAAC
APAAC
### Hybrid Feature Integration
Data Balancing
SMOTE-ENN
### Feature Reduction
PCA
### Classification
Support Vector Machine (SVM)
Evaluation
Accuracy
Sensitivity
Specificity
MCC
## 🚀 System Requirements
Python Environment
Python ≥ 3.8
Required Libraries

Install dependencies using:

pip install -r requirements.txt
Key packages:
numpy
pandas
scikit-learn
imbalanced-learn
pyspark
## 🔧 How to Run
1. Clone repository
git clone https://github.com/salman-khan-mrd/RBP-Spark.git
cd RBP-Spark
2. Install dependencies
pip install -r requirements.txt
3. Run full pipeline
python main.py

This will execute:

Feature extraction
Preprocessing (SMOTE-ENN + PCA)
Model training
Evaluation
## ⚡ Spark Execution (Distributed Mode)

To run in Apache Spark cluster mode:

spark-submit main.py
Configuration example:
Cluster mode or local multi-core execution supported
Number of nodes can be configured in Spark environment settings
📥 Input Format

Input protein sequences should be provided in:

FASTA format OR
Preprocessed CSV format (feature-ready)
## 📤 Output

The system generates:

Classification results (RBP / non-RBP)
### Performance metrics:
Accuracy
Sensitivity
Specificity
MCC
Execution logs
## 📈 Expected Results

On benchmark evaluation, the framework achieves:

High predictive performance across cross-validation
Consistent results across independent species datasets
Significant speedup using Spark distributed processing
## 🖥️ Hardware & Execution Setup

Experiments were conducted using:

### Multi-core CPU environment
Apache Spark distributed cluster
Scalable node-based configuration for efficiency testing

Execution time varies depending on dataset size and cluster configuration.

## 📌 Reproducibility Notes
Random seeds are fixed for reproducibility where applicable
All feature extraction and evaluation steps are deterministic under the provided pipeline
Core implementation is fully available in this repository
## ⚠️ Limitations
Current implementation focuses on sequence-derived features
Structural and protein language model embeddings are not included in this version
Advanced model fine-tuning modules are not part of the released pipeline
