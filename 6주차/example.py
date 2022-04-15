publisher = ['굿스포츠', '나무수','대한미디어', '대한미디어', '굿스포츠','굿스포츠','이상미디어','이상미디어','심성당']
nest = {'굿스포츠': 7000, '나무수': 13000, '대한미디어': 28500, '이상미디어': 16500, '삼성당': 7500}


print(nest)

result = []
index = 0
for i in publisher:
    index += 1
    print(index,"번째 메인쿼리 입력 :",i)
    print()

    for key, value in nest.items():
        print(key, value)
        if key == i:
            result.append(value)
    print()
    # break

# print(result)

