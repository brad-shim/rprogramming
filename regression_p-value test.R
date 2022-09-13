# step1) 임의 모델 생성
# step2) 데이터 생성
# step3) 다른 샘플을 통해 모델과의 적합도 확인을 위한 그래프 생성


# 2세 ~ 10세 아이들의 연령 별 몸무게
# 임의 모델 y=2x+10을 따른다고 가정

# 연령을 입력하면 체중을 돌려주는 함수
fun_w <- function(x) {
  y <- 2*x + 10
  return(y)
}

# 2세부터 10세까지 연령을 월별(1/12)로 생성
age <- sample(seq(2, 10, by=1/12), 3000, replace = TRUE)

# 체중에 정규분포 확률 변수 값을 더해서 랜덤한 데이터 생성
weight <- fun_w(age) + rnorm(length(age))

# 산점도와 회귀직선 그리기
plot(age, weight, xlim = c(2, 10), ylim = c(10, 34)) #type이 n이면 도형이 없는 그래프
abline(a=10, b=2, col = "red", lty = 3, lwd = 5, type = "n") # line type 3은 dashed

# 임의 데이터 5개를 생성하고 이에 대한 적합선을 그리기

# 임의 데이터 5개 생성
sample_age <- sample(seq(2, 10, by=1/12), 5, replace = TRUE)

# 동일한 나이의 다른 아이들 몸무게를 표시하기 위해서는 이 아랫부분만 실행
# 즉 회귀계수의 변동이 발생하는 것을 
sample_weight <- fun_w(sample_age) + rnorm(length(sample_age))

# 샘플 데이터 표시하기
points(sample_age, sample_weight, col="orange")
abline(a=10, b=2, col = "red")

# 적합선 찾기
sample_lm <- lm(sample_weight ~ sample_age)

# 적합선 그리기
abline(sample_lm, col="blue")

# 그래프를 그려보면, 동일 연령의 다른 아이들이 선택될 때마다 회귀 계수도 변경됨
# 즉, 적합선이 달라지고, 이의 변동이 유의한지에 대해 적합도 검정, p-value가 필요함


