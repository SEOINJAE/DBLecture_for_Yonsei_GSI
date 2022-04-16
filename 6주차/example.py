# 메인 쿼리의 데이터
main = ['굿스포츠', '나무수','대한미디어', '대한미디어', '굿스포츠','굿스포츠','이상미디어','이상미디어','심성당']

# 서브 쿼리의 데이터
sub = {'굿스포츠': 7000, '나무수': 13000, '대한미디어': 28500, '이상미디어': 16500, '삼성당': 7500}

result = []
index = 0

# 메인쿼리
for i in main:
    index += 1
    print(index,"번째 행의 메인쿼리 입력 publisher :",i)
    print()

    # 서브쿼리
    for key, value in sub.items():
        print("서브쿼리의 publisher:",key, "서브쿼리의 가격:",  value)
        if key == i:
            result.append(value)
    print()

# print(result)

