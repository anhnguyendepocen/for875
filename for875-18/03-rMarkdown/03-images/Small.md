---
title: "R Markdown"
author: "Andy Finley"
date: "April 3, 2017"
output:
  html_document: default
  pdf_document: default
---

Basic formatting: 

*italic* 

**bold**

~~strikethrough~~ 

A code chunk:


```r
x <- 1:10
y <- 10:1
mean(x)
```

```
## [1] 5.5
```

```r
sd(y)
```

```
## [1] 3.02765
```

Inline code:

10

Inline code not executed:

`5+5`
