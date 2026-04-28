## [Swift] Machine learning and AI
### CH3. Model training with Create ML
https://developer.apple.com/tutorials/develop-in-swift/train-a-core-ml-model
#### 1. Data Basics
Generally, the larger the dataset, the more accurate the resulting model.
일반적으로 데이터셋이 클수록 모델의 정확도가 높아진다.

- Training data is used to train the model.
training data는 모델 학습에 사용된다.

- Validation data is used to evaluate and tune the model, not to train it.
validation data는 모델을 평가하고 튜닝하는 데 사용되며, 학습에는 사용되지 않는다.

- Test data is used to evaluate the final trained model’s performance.
test data는 학습이 완료된 모델의 성능을 최종적으로 평가하는 데 사용된다.

#### 2. Evaluation Metrics
**Maximum Error**
- The largest error between prediction and actual value.
예측값과 실제값 사이의 가장 큰 오차 (최악의 케이스)
- Lower values are better.
값이 작을수록 좋다

**RMS Error (Root Mean Square Error)**
- Represents the average error across the entire model.
모델 전체에 걸친 평균적인 오차 수준
- Always less than or equal to the maximum error.
max error보다 항상 작거나 같다
- Used to evaluate overall model performance.
전체적인 예측 성능 평가에 사용된다

**=> Key Insight**
- Maximum error = worst-case error
-> 최악의 경우
- RMS error = overall accuracy
->전반적인 정확도

#### 3. Important Concept
- Real-world data contains outliers and noise.
현실 데이터는 이상치(outlier)와 노이즈를 포함한다.

- Even a good model can have large errors on some data points.
좋은 모델이라도 일부 데이터에서는 큰 오차가 발생할 수 있다.

- Evaluate models based on usefulness, not just correctness.
모델은 “정확한가”보다 “유용한가”로 평가해야 한다.

#### 4. Overfitting vs Good Model
- Overfitting models try to fit all data, including outliers.
과적합 모델은 이상치까지 억지로 맞추려고 한다.

- They may have very low training error but perform poorly in real situations.
training error는 낮지만 실제 성능은 나쁠 수 있다.

- Good models focus on general patterns, not noise.
좋은 모델은 노이즈가 아닌 전체 패턴에 집중한다.

- They may show higher training error when data is inconsistent.
데이터가 일관되지 않을 경우 training error가 더 높게 나올 수 있다.

**=> Key Conclusion**
- Having errors ≠ being a bad model
에러가 있다고 해서 나쁜 모델은 아니다
- What matters is whether the model is useful in practice
중요한 것은 실제로 쓸 수 있는 모델인가이다

#### 5. Algorithms
- Choosing the correct algorithm is critical for accurate results.
적절한 알고리즘 선택이 정확한 모델을 만드는 데 가장 중요하다

- Boosted Tree and Random Forest are advanced forms of decision trees.
Boosted Tree와 Random Forest는 결정 트리의 확장된 형태이다

- They can improve performance but cannot solve fundamentally unsuitable problems.
성능은 개선할 수 있지만, 근본적으로 해결할 수 없는 문제를 해결해주지는 않는다

#### 6. Practical Guidelines
- Validation data is not used for training.
validation data는 학습에 사용되지 않는다

- Do not choose a model solely based on lowest error.
단순히 에러가 가장 낮다고 해서 모델을 선택하면 안 된다

- Choose a model that fits the problem appropriately.
문제에 적합한 모델을 선택해야 한다


#### Reflect on the concepts
- Explore different algorithms to find the best fit for your use case.
다양한 알고리즘을 시도하여 문제에 가장 적합한 것을 찾아야 한다.
- Adjust training parameters to improve performance.
학습 파라미터를 조정하여 성능을 개선할 수 있다.
- Add more data to improve accuracy.
데이터를 추가하면 정확도가 향상될 수 있다.
- Diversify training data to improve generalization.
다양한 데이터를 사용하면 일반화 성능이 좋아진다.

#### Topics and skills covered
- Understanding the importance of high-quality data
고품질 데이터의 중요성 이해
- Assigning data correctly to training processes
데이터를 올바르게 분배하는 능력 (train / validation / test)
- Selecting the appropriate algorithm for your goal
목표에 맞는 알고리즘 선택

#### Default Setting으로 모델 학습시키기
- Setting
<img src="https://github.com/yuseongchae/2026_SwiftStudy_Tutorials/blob/main/MachineLearningAI/TrailAnalyzer/images/Settings.png" width="70%">

- Training
<img src="https://github.com/yuseongchae/2026_SwiftStudy_Tutorials/blob/main/MachineLearningAI/TrailAnalyzer/images/Training.png" width="70%">

- Evaluation
<img src="https://github.com/yuseongchae/2026_SwiftStudy_Tutorials/blob/main/MachineLearningAI/TrailAnalyzer/images/Evaluation.png" width="70%">

- Preview
<img src="https://github.com/yuseongchae/2026_SwiftStudy_Tutorials/blob/main/MachineLearningAI/TrailAnalyzer/images/Preview.png" width="70%">

- Output
<img src="https://github.com/yuseongchae/2026_SwiftStudy_Tutorials/blob/main/MachineLearningAI/TrailAnalyzer/images/Output.png" width="70%">

#### 알고리즘별 모델 학습
Decision Tree
<img src="https://github.com/yuseongchae/2026_SwiftStudy_Tutorials/blob/main/MachineLearningAI/TrailAnalyzer/images/DecisionTree_set.png" width="50%"><img src="https://github.com/yuseongchae/2026_SwiftStudy_Tutorials/blob/main/MachineLearningAI/TrailAnalyzer/images/DecisionTree_eval.png" width="50%">

Linear Regression
<img src="https://github.com/yuseongchae/2026_SwiftStudy_Tutorials/blob/main/MachineLearningAI/TrailAnalyzer/images/LinearRegression_set.png" width="50%"><img src="https://github.com/yuseongchae/2026_SwiftStudy_Tutorials/blob/main/MachineLearningAI/TrailAnalyzer/images/LinearRegression_eval.png" width="50%">
