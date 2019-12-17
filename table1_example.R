# https://cran.r-project.org/web/packages/table1/vignettes/table1-examples.htmllibrary(boot) 
library(table1)
library(tidyverse)

melanoma2 <- as_tibble(melanoma)

# Factor the basic variables that
# we're interested in
melanoma2$status <- 
  factor(melanoma2$status, 
         levels=c(2,1,3),
         labels=c("Alive", # Reference
                  "Melanoma death", 
                  "Non-melanoma death"))

# categories on the L side come after the ~, cohort comparison (trop high/low) come after |
table1(~ factor(sex) + age + factor(ulcer) + thickness | status, data=melanoma2)


melanoma2$sex <- 
  factor(melanoma2$sex, levels=c(1,0),
         labels=c("Male", 
                  "Female"))

melanoma2$ulcer <- 
  factor(melanoma2$ulcer, levels=c(0,1),
         labels=c("Absent", 
                  "Present"))

label(melanoma2$sex)       <- "Sex"
label(melanoma2$age)       <- "Age"
label(melanoma2$ulcer)     <- "Ulceration"
label(melanoma2$thickness) <- "Thickness"

units(melanoma2$age)       <- "years"
units(melanoma2$thickness) <- "mm"

table1(~ sex + age + ulcer + thickness | status, data=melanoma2, overall="Total")