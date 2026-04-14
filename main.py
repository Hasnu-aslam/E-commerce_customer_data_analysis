from sklearn.tree import DecisionTreeClassifier
import pandas as pd

data = pd.read_csv("ecommerce_dataset.csv")
print("Columns in dataset:", data.columns)


X = data[['purchase_count', 'total_spent', 'last_purchase_days']]
y = data["category"]# Loyal / At Risk / One-time

model = DecisionTreeClassifier()
model.fit(X, y)

sample = pd.DataFrame([[5, 2000, 10]], columns=['purchase_count', 'total_spent', 'last_purchase_days'])
prediction = model.predict(sample)
print(prediction)