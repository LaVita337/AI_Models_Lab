# List & Dictionary


## List

 ####  1차원 리스트
 
 ```python
list_o = ['a','b','c','d','e','f'] # 한 줄로 늘어선 리스트
 ```



 #### 2차원 리스트
```python
list_tw = [[1, 2], ['ㄱ', 'ㄴ'], ['a', 'b']] # 아래 이미지와 같이 상상해 볼 수 있다
```

<img width="600" alt="Screenshot 2023-06-28 at 5 21 49 PM" src="https://github.com/LaVita337/DH_Log/assets/107906605/691f727a-5e52-426a-bc17-657b62048de9">

#### 3차원 리스트
```python
# 4행, 3열, depth 2인 3차원 리스트
list_th = [[[1, 2, 3], [4, 5, 6], [7, 8, 9], [10, 11, 12]],\
           [['a', 'b', 'c'], ['d', 'e', 'f'], ['g', 'h', 'i'], ['j', 'k', 'l']]]
```
##### 📍 depth의 길이는 len()으로 확인가능

<img width="600" alt="Screenshot 2023-06-28 at 5 58 29 PM" src="https://github.com/LaVita337/DH_Log/assets/107906605/83b335f8-d376-42dc-a8d6-5b0d94bdbd19">

---

## Dictionary

##### 🔶 key와 value를 추가하는 함수 : setdfault(), update()

```python
setdfault() # 이미 해당 key가 있을 때: 그 key의 value를 반환
            # key가 없을 때: 딕셔너리에 key:value를 저장하고 value를 반환

update() # 특정 key-value 조합을 삽입

```
> #### Q. setdefault() 함수와 update() 함수의 차이가 무엇일까요?
> 
> setdefault() 함수에 key와 value를 모두 넣을 경우, key가 딕셔너리에 이미 존재한다면 setdefault() 함수는 데이터에 영향을 주지 못합니다. (setdefault() 함수에 입력된 > value 값 무시)
> 반면 update() 함수는 기존의 value 값과 상관없이 딕셔너리의 데이터를 업데이트합니다.


##### 🔶 key-value 삭제하는 함수 : pop(), popitem()
##### 🔶 딕셔너리 생성하는 함수 :  fromkeys()  



### in / not in [예약어]
- ##### 리스트와 딕셔너리에 공통으로 사용가능
- ##### 요소가 들어있는지 확인하는 예약어
- ##### 조건문과 자주 쓰임
- ##### in / not in 의 리턴값은 bool. 즉 True 또는 False로 리턴



