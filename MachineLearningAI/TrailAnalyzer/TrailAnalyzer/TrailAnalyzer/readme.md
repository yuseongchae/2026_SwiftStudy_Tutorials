## [Swift] Machine learning and AI
### CH4. Import models with Core ML
https://developer.apple.com/tutorials/develop-in-swift/custom-models-with-core-ml

### Check your Understanding
- 프로젝트에 model을 적용시킬 때 Xcode가 자동으로 맞춤형 인터페이스를 자동으로 생성한다.
- Generic type은 type을 미리 고정하지 않고, 나중에 결정할 수 있다. (= 타입 파라미터를 받으면 제네릭이다)

### Reflect on the concepts
1. Understanding Data & Model
- A model makes predictions based on patterns in its training data.

모델은 학습 데이터의 패턴을 기반으로 예측을 수행한다.

- To get accurate results, you must understand both the model and your data.

정확한 결과를 위해서는 모델과 데이터 모두를 이해해야 한다.

2. Structuring Input & Output
- You need to properly structure input data before feeding it into a model.

모델에 입력하기 전에 데이터를 적절히 구조화해야 한다.

- Model outputs must be interpreted and converted into user-friendly results.

모델의 출력 결과는 해석하여 사용자에게 이해하기 쉬운 형태로 변환해야 한다.

- Raw numerical results alone are not meaningful to users.

단순한 숫자 결과만으로는 사용자에게 의미가 없다.

3. Practical Application
- You used a model to predict the risk level of a trail. 
트레일의 위험도를 예측하는 모델을 활용했다.
- The key is transforming predictions into understandable information.
핵심은 예측 결과를 이해 가능한 정보로 변환하는 것이다.

### Topics and skills covered
- Importing and using an existing Core ML model
기존 Core ML 모델을 가져와 사용하는 방법

- Interpreting numerical outputs into meaningful predictions
숫자 결과를 의미 있는 예측으로 변환하는 능력

- Using generic types to build reusable views
제네릭 타입을 활용한 재사용 가능한 뷰 설계

### 결론
머신러닝은 단순한 예측이 아니라 결과를 이해 가능하고 유용하게 만드는 것이다.

#### 메인 화면
<p>
  <img src="https://github.com/yuseongchae/2026_SwiftStudy_Tutorials/blob/main/MachineLearningAI/TrailAnalyzer/TrailAnalyzer/TrailAnalyzer/Assets.xcassets/images/Main.imageset/Main.png" width="20%">
</p>

#### 선택하고 결과 보기
**High Risk**
<p>
  <img src="https://github.com/yuseongchae/2026_SwiftStudy_Tutorials/blob/main/MachineLearningAI/TrailAnalyzer/TrailAnalyzer/TrailAnalyzer/Assets.xcassets/images/Picker.imageset/Picker.png" width="20%">
  <img src="https://github.com/yuseongchae/2026_SwiftStudy_Tutorials/blob/main/MachineLearningAI/TrailAnalyzer/TrailAnalyzer/TrailAnalyzer/Assets.xcassets/images/HighRisk.imageset/HighRisk.png" width="20%">
</p>

**Easy**
<p>
  <img src="https://github.com/yuseongchae/2026_SwiftStudy_Tutorials/blob/main/MachineLearningAI/TrailAnalyzer/TrailAnalyzer/TrailAnalyzer/Assets.xcassets/images/LowValue.imageset/LowValue.png" width="20%">
  <img src="https://github.com/yuseongchae/2026_SwiftStudy_Tutorials/blob/main/MachineLearningAI/TrailAnalyzer/TrailAnalyzer/TrailAnalyzer/Assets.xcassets/images/EasyResult.imageset/Easy.png" width="20%">
</p>

#### 난이도 정보
<p>
  <img src="https://github.com/yuseongchae/2026_SwiftStudy_Tutorials/blob/main/MachineLearningAI/TrailAnalyzer/TrailAnalyzer/TrailAnalyzer/Assets.xcassets/images/Info.imageset/Info.png" width="20%">
</p>
