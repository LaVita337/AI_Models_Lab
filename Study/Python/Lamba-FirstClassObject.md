> ## 람다 표현식이란?
>  람다를 포함한 식을 람다 표현식(Lambda Expression) 이라고 부르고, 람다 표현식으로 쓴 함수는 람다 함수(또는 익명 함수)라고 한다
>  람다 함수는 간단하고, 코드를 조금 더 효율적으로 작성할 수 있다

````python
(lambda 매개변수 : 리턴값)(인수)
````

<img width="600" alt="Screenshot 2023-06-29 at 4 36 43 PM" src="https://github.com/LaVita337/DH_Log/assets/107906605/6f42acff-8344-4f0e-9990-c429b90ca579">

<img width="600" alt="Screenshot 2023-06-29 at 4 36 57 PM" src="https://github.com/LaVita337/DH_Log/assets/107906605/63ed090c-5634-4b87-997d-86b3fce4da80">

<img width="600" alt="Screenshot 2023-06-29 at 4 37 12 PM" src="https://github.com/LaVita337/DH_Log/assets/107906605/df3e8b12-879b-4194-bfcc-7aecc4bd8247">


- 람다 함수는 익명의 함수를 만들기 때문에, 함수를 생성한 이후에 다시 이 함수를 호출하려면 람다 표현식을 변수에 할당해주어야 한다.
- 변수에 람다 표현식을 할당하려면 괄호는 생략
- 람다 표현식 안에서는 새 변수를 만들 수 없음(새로운 변수가 필요한 코드일 경우에는 일반 함수를 작성)
- 바깥 변수를 참조하는 것은 가능

### 람다 표현식을 인수로 사용하는 함수 3가지

- ### map()
  ````
  map(적용시킬 함수, 적용할 값들)

  # 표현 방식
  map(함수, 리스트 or 튜플)
  ````
- ### filter()

  ```python
  # list(filter() + 람다 함수)
  list(filter(lambda x : x % 2 == 1, two)) # 출력값: [1, 3, 5, 7, 9]

  # 파이썬은 조건이 없으면 True일 때만 통과
  list(filter(lambda x : x % 2, two))   # 출력값: [1, 3, 5, 7, 9]
                                      # 파이썬은 다른 조건이 없으면 참일 때만 통과시키기 때문에 비교 연산자 ==가 없어도 출력
  ```
    - 리스트에 들어있는 원소들을 함수에 적용시켜서 결과가 참인 값들로 구성된 새로운 리스트를 만들어준다.
    - filter()를 사용하면 리스트에서 원하는 값들만 남길 수 있다.
  
- ### reduce()
  ```python
  reduce(함수, 이터러블 객체) # 파이썬3부턴 내장함수가 아님(from functools import reduce 로 실행가능)
  ```
- 결과를 누적해서 반환하는 함수

> [참고] functools 모듈
> functools 모듈은 고차원 함수(high-order-function)를 위해 만들어진 것으로, 다른 함수에 작용하거나 다른 함수를 반환하는 함수입니다.
> [파이썬 공식 문서](https://docs.python.org/ko/3/library/functools.html)

  

