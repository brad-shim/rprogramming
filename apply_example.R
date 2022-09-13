a <- matrix(1:12, nrow = 3, ncol = 4)

# 행기준 연산

apply(a, 1, max)

max(a[1,])
max(a[2,])
max(a[3,])

for (i in 1:3) {
  print(max(a[i,]))
}

# 열기준 연산

apply(a, 2, max)

max(a[,1])
max(a[,2])
max(a[,3])
max(a[,4])

for (i in 1:4) {
  print(max(a[,i]))
}

# User-defined function 사용

my_f <- function(vec) {
  max(vec)^2 + 3
}

apply(a, 2, my_f)


# 3차원 array

a_3d <- array(1:36, dim = c(3,4,3))

apply(a_3d, 1, max)
apply(a_3d, 2, max)
apply(a_3d, 3, max)




