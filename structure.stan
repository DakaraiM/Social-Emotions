data {
  int<lower=0> N1;  // number of observations (laptop)
  int<lower=0> N2;  // number of observations (longhand)
  int<lower=0> N;   // 
  vector[N1] y1;  // wordcount  (laptop)
  vector[N2] y2;  // wordcount  (longhand)
}
parameters {
  real<lower=0> mu_1;  // mean of group 1
  real beta;  // difference in means
  real<lower=0> sigma;  // pooled standard deviation
}
transformed parameters {
  real<lower=0> mu_2 = mu_1 + beta; 
}
model {
  y1 ~ normal(mu_1, sigma);
  y2 ~ normal(mu_2, sigma);
  // prior
  mu_1 ~ normal(0.5, 2.5);
  beta ~ normal(0, 2.5);
  sigma ~ student_t(4, 0, 1);
}
generated quantities {
  real y1rep[N1];
  real y2rep[N2];
  real cohen_d;
  cohen_d = beta/sigma;
  for (i in 1:N1) {
    y1rep[i] = normal_rng(mu_1, sigma);
  }
  for (i in 1:N2) {
    y2rep[i] = normal_rng(mu_2, sigma);
  }
}