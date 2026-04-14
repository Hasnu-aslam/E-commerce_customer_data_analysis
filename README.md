🚀 E-Commerce Customer Insights & Fraud Detection System

An interactive data mining dashboard built using R and Shiny to analyze customer behavior, detect fraud, and identify fake reviews in an e-commerce platform.

⸻

📌 Overview

This project applies core data mining techniques to solve real-world e-commerce problems. It provides insights into customer behavior, helps detect fraudulent transactions, and improves platform trust by identifying fake reviews.

The system is implemented as an interactive dashboard, allowing users to upload datasets and perform real-time analysis.

⸻

🎯 Features
	•	🧠 Customer Classification
	•	Classifies customers into:
	•	Loyal
	•	At Risk
	•	One-time Buyers
	•	Uses Decision Tree algorithm
	•	📊 Customer Segmentation
	•	Groups customers based on purchasing behavior
	•	Implemented using K-Means clustering
	•	🚨 Fraud Detection
	•	Identifies suspicious transactions using anomaly detection
	•	Flags high-value unusual transactions
	•	🌐 Fake Review Detection
	•	Detects spam/fake reviews using text pattern analysis
	•	Identifies keywords like “fake”, “http”, etc.
	•	🖥️ Interactive Dashboard
	•	Upload dataset
	•	Run analysis with one click
	•	View results in tables and graphs

⸻

🛠️ Tech Stack
	•	Language: R
	•	Framework: Shiny
	•	Libraries:
	•	shiny
	•	rpart
	•	ggplot2
	•	cluster
	•	tidytext

⸻

📂 Project Structure
Ecom_project/
│
├── app.R                 # Main Shiny application
├── ecommerce_dataset.csv # Sample dataset
├── README.md             # Project documentation
└── report/               # Project report (optional)

⚙️ Installation & Setup

1. Clone the repository
   
git clone https://github.com/your-username/ecom-project.git
cd ecom-project

2. Install required packages

install.packages(c("shiny", "rpart", "ggplot2", "cluster", "tidytext"))

3. Run the application

library(shiny)
runApp("app.R")

📊 How to Use
	1.	Launch the Shiny app
	2.	Upload your dataset (.csv format)
	3.	Click “Run Analysis”
	4.	Navigate through tabs:
	•	Data Preview
	•	Classification
	•	Clustering
	•	Fraud Detection
	•	Fake Reviews

⸻

📸 Screenshots (Add your own)
	•	Dashboard UI
	•	Cluster Visualization
	•	Fraud Detection Table
	•	Prediction Output

🧠 Methodology
	•	Classification: Decision Tree (rpart)
	•	Clustering: K-Means
	•	Fraud Detection: Threshold-based anomaly detection
	•	Web Mining: Keyword-based fake review detection

⸻

✅ Advantages
	•	Easy-to-use interface
	•	Real-time analysis
	•	Combines multiple data mining techniques
	•	Useful for business insights

⸻

⚠️ Limitations
	•	Uses simple models
	•	Dataset is simulated
	•	Basic text analysis for fake reviews

⸻

🔮 Future Improvements
	•	Advanced ML models (Random Forest, XGBoost)
	•	Deep learning for fraud detection
	•	NLP-based fake review detection
	•	Deploy dashboard online

⸻

👨‍💻 Author

Mohamed Aslam


