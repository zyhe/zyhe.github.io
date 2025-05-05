---
layout: post
title: "Beauty of Mathematics: Hats, Coins, and Paradoxes"
subtitle: "On derangements, fair coins, and the St. Petersburg paradox"
date: 2025-05-05 07:00:00 -0200
background: '/img/posts/2025-5-5-puzzles/archimede.avif'
---

# Beauty of Mathematics: Hats, Coins, and Paradoxes

Zhiyu He, May 5, 2025  

How can you make a table of engineering researchers, each with diverse interests, all concentrate on a single topic? Ask intriguing mathematical questions.  

During our lab retreat in Stoos in April 2025, as the dinner conversation gradually converged to intelligence, I threw some mathematical puzzles that I stumbled upon earlier this year. Surprisingly, they quickly captured everyone's attention. The next hour solely revolved around proposing various questions, contemplating attacking points, sharing reasoning, and challenging each other.  

Let me go through some of these interesting questions to give the reader a glimpse of the beauty of mathematics.  

## Derangement

Here is the famous hat-check problem, which I learned from Klaus.

> Suppose that $N$ people check their hats into a restaurant. The hat-checker is unfortunately absent-minded and forgets which hat belongs to whom. Instead, the hats are randomly redistributed to people. What is the probability that nobody gets his or her own hat back?

<div style="text-align: center; margin-top: 20px; margin-bottom: 30px;">
  <img src="/img/posts/2025-5-5-puzzles/hat.avif" alt="Hats" style="width: 60%; display: block; margin: 0 auto;">
</div>

The number of arrangements for redistributing hats is $n!$. The problem is thus reduced to finding the number of permutations $D(N)$ such that everybody receives a hat belonging to another person.

We apply a recursive approach, akin to dynamic programming in computer science, by breaking into sub-problems. The base cases are easy, and we can show by enumeration that $D(1)=0, D(2)=1$. We proceed to analyze the general case. Let us focus on the first person $P_1$, who collects the hat $h_i$ of person $P_i$, and $i=2,\ldots,N$. We distinguish two cases.

- First, person $P_i$ happens to grab the hat $h_1$. Then, we exclude persons $P_1$ and $P_i$ from the population and address a reduced problem with $N-2$ people. When $i$ is given, the number of desirable arrangements is $D(N-2)$.

- Second, person $P_i$ does not receive the hat $h_1$. This scenario, albeit appearing complicated, also allows a similar analysis. Let us exclude person $1$ and consider the remaining population involving persons $2, \ldots, i, \ldots, N$. We need to redistribute the hats $h_1, \ldots, h_{i-1}, h_{i+1}, \ldots, h_N$. Since $h_1$ cannot be assigned to person $P_i$, we relabel this person as $\hat{P}_1$ and conclude that this setting is equivalent to the scenario with $N-1$ people. The number of arrangements for a given $i$ is therefore $D(N-1)$.

Since there $N-1$ choices of $i$, we have the following recurrence formula:

$$
  D(N) = (N-1) * (D(N-1) + D(N-2)),
$$

with the base cases $D(1)=0$, $D(2)=1$. A closed-form expression of $D(N)$ can be further derived from the above formula. The probability that nobody receives the original hat is $D(N)/N!$.

The technical word summarizing this problem is derangement, i.e., a permutation of the elements in a set such that no element is allocated to its original position. See the Wikipedia [page](https://en.wikipedia.org/wiki/Derangement) and this [note](https://www.math.emory.edu/~rg/derangements.pdf) for more details.

## Make a fair coin from a biased coin

We have a biased coin, whose probability of coming up with a tail or a head is different. Of course, if we flip the coin sufficiently many times, the number of tails will almost always differ from the number of heads. Now the question is:

> How to make a "fair coin" out of this biased coin?

By a "fair coin", we mean that the probabilities of achieving either of two outcomes equal.

<div style="text-align: center; margin-top: 20px; margin-bottom: 30px;">
  <img src="/img/posts/2025-5-5-puzzles/coin.avif" alt="Coin" style="width: 60%; display: block; margin: 0 auto;">
</div>

The key idea is to exploit pairs of coins to extract fair outcomes. It is clear that flipping this coin only once is hopeless. However, we can make several flips and leverage the collective results.

Without loss of generality, consider discrete random variables $X_1, X_2$ with the following distribution

$$
  \Pr(X_i = 0) = p, \quad \Pr(X_i = 1) = 1 - p, \quad p\in (0,1),
$$

where $X_i$ denotes the variable at the $i$-th flip, and $i=1,2$. Let $Z=f(X_1, X_2)$ be a new random variable, and the mapping $f$ is given by

$$
  f(01) = 0, ~ f(10) = 1, ~ f(00) = \Lambda, ~ f(11) = \Lambda,
$$

where $\Lambda$ represents an empty value. Then,

$$
  \Pr(Z=0|X_1 \neq X_2) = \frac{\Pr(Z=0, X_1 \neq X_2)}{\Pr(X_1 \neq X_2)} = \frac{p(1-p)}{2p(1-p)} = \frac{1}{2}.
$$

Analogously, $\Pr(Z=1\|X_1 \neq X_2) = 1/2$. Hence, this new variable $Z$ has equal probabilities of taking the value of $0$ or $1$, thereby mimicking the outcome of a "fair coin". Intuitively, since 01 and 10 are equally likely, this method filters out the bias.

In a similar vein, we define a mapping from multiple $X_i$ to multiple $Z_j$ to replicate a sequence of fair coin flips. The above idea of integrating multiple random variables is also present in *block codes* analyzed by information theorists.

## St. Petersburg paradox

We are offered an opportunity to play a game of flipping a fair coin. That is, the probability that a head or a tail appears at each round is 0.5. The game terminates whenever a head comes up, and afterward, we win $2^k$ euros, where $k \geq 1$ denotes the total number of times of flipping the coin. For example, if we get a head right the first time, then we obtain $2$ euros and are no longer allowed to continue; if we have a tail and then a head, then we collect $4$ euros; if we obtain two tails and finally a head, then we accumulate $8$ euros.

> How much money are you willing to pay to participate in this game?

<div style="text-align: center; margin-top: 20px; margin-bottom: 30px;">
  <img src="/img/posts/2025-5-5-puzzles/coin-2.avif" alt="Coins" style="width: 60%; display: block; margin: 0 auto;">
</div>

At first glance, the reasonable price for this game seems low. After all, it is highly unlikely that we observe tails for more than $5$ consecutive rounds, translating to a return larger than $64$ euros. What does the math say, though?

The (classical) mathematics suggests examining the expected return. Our return is essentially a discrete random variable, which takes the values of $2, 4, 8, \ldots$ with probabilities of $1/2, 1/4, 1/8, \ldots$. Hence, its expectation is

$$
  \sum_{k=1}^{\infty} 2^k * \frac{1}{2^k} = 2*\frac{1}{2} + 4*\frac{1}{4} + \ldots = \infty.
$$

In other words, the expected return is arbitrarily large. What is wrong with our intuition?

The key reason is that we do not have a precise understanding of the tail probability corresponding to an extreme event. In this problem, the diminishing probability of the extremely lucky case (where we have tails consecutively) is compensated by the exponential growth of the return. This balance contributes to the infinite expected return.  

There are many follow-up theories to fix the mismatch between our gut feeling and theoretical analysis. For instance, researchers have developed the expected utility theory and probability weighting to account for our tendency of risk aversion, indicating an objective different from the expected value in decision-making, see also this Wikipedia [page](https://en.wikipedia.org/wiki/St._Petersburg_paradox#Expected_utility_theory).

## Summary  

We discussed several intriguing mathematical problems and clarified how they illuminate ideas across statistics, decision science, and information theory. Next time when you sit with engineers and scientists, tell these problems to them!  
