## [Swift] Machine learning and AI
### CH2. Recognize text in images
Extract text from images
https://developer.apple.com/tutorials/develop-in-swift/extract-text-from-images

#### Check Your Understanding
- 모델이 정확하지 않거나 텍스트가 잘 보이지 않는 경우 Text recognition 결과는 틀릴 수도 있다. (Text recognition in an image can result in errors if the model is not completely accurate or when the text doesn’t stand out clearly enough.)
- `RecognizeTextRequest`가 반환하는 중요한 세 가지 값
    - The identified text(인식된 텍스트)
    - Its location image(이미지에서의 텍스트 위치) 
    - The confidence level that text value (그 텍스트가 맞을 확률)
    => 텍스트 인식에서 가장 중요한 결과는 텍스트 자체이다. 하지만 텍스트 인식은 항상 정확하지 않기 때문에, 그 텍스트의 신뢰도와 위치 역시 중요한 정보가 된다.
- 텍스트 인식 결과를 100% 확신하지 못하는 경우에는 어떻게 해야 할까?
    - 텍스트에 대해 여러 후보 결과(candidates)가 제공되고, 각 후보마다 신뢰도(확률)가 함께 주어진다.
    - 완벽하지 않은 결과라도 앱에서 활용할 수 있다. 가장 신뢰도가 높은 갑을 사용하거나, 여러 결과를 함께 보여줄 수도 있다.
    (Multiple candidates for the text value are provided, each with an associated confidence level. (Even imperfect results can be useful to your app. You might use the highest-confidence value or choose to display multiple possible results.)
    
#### Reflect on the concepts
- built-in model 머신러닝을 활용해 이미지에서 텍스트 찾기
- Vision framework
    - 이미지에서 텍스트를 찾는것 뿐만 아니라 이미지의 특정 부분에 집중하거나 여러 이미지에서 객체를 추적하고, 손과 신체의 포즈를 감지하는 것도 가능하다.
- Translation Framework 활용해 번역 기능 넣기

#### Topics and skills covered
- Recognizing text values in images
- Working with the text’s location coordinates
- Translating text from images
- Creating custom view modifiers


#### Translation Framework 활용해보기
<img src="TranslationButton" width="20%"><img src="Translated" width="20%">

#### `recognitionLevel` modifier에 따른 분석 정확도 차이 확인해보기
- fast로 설정했을 경우
<img src="RecogLevel_Fast" width="20%">
변환 속도는 빠르지만 부정확한 결과가 나올 수 있다.

- accurate
<img src="Translated" width="20%">
fast보다는 변환 속도가 느리지만 정확도를 높일 수 있다.
=> The recognition level is a tradeoff between speed and accuracy.
(trade-off : 하나를 얻으면 하나를 잃는 관계)

