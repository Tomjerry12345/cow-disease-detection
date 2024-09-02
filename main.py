from flask import Flask, request, jsonify
import pickle
import numpy as np

app = Flask(__name__)

with open('random_forest_model.pkl', 'rb') as file:
    rf_model_1 = pickle.load(file)


@app.route('/predict', methods=['POST'])
def predict():
    data = request.get_json(force=True)
    input_features = np.array([data['features']])
    prediction = rf_model_1.predict(input_features)
    return jsonify({'prediction': prediction[0]})


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
