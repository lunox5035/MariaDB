-- 함수: 수학

-- abs
select abs(1),abs(-1);

-- ceil
select ceil(3.14),ceiling(3.14);

-- floor
select floor(3.14);

-- mod
select mod(10,3);

-- round(x): x에 가장 근접한 정수 (반올림?)
-- round(x, d): x값 중에 소숫점 d자리에 가장 근접한 실수
SELECT ROUND(1.498), ROUND(1.498, 1), ROUND(1.498, 0);

-- power(x,y), pow(x,y): x의 y승
select power(2,10),pow(2,10);

-- sign(x): 음수 양수 확인
SELECT SIGN(20), SIGN(- 100), SIGN(0);

-- greatest(x,y,...), least(x,y,...):
select greatest(10,40,20,50),least(10,40,20,50);
select greatest('b','A','C','B'),greatest('hello','help','hell');

