#' Workflow of standard Analysis-of-variace practice
#' 
#' We test for difference in risk factors between the cohort groups. If the data passes both normality check and homogeneity check, we used one-way ANOVA test. If the data passes normality check but fails homogeneity check, we used Welch's one-way test. If the data fails normality check, we used Kruskal-Wallis test. Then, we use Tukey test to discover the pairs of cohorts that have significant difference.
#' @param y vector of Groups, must be a factor
#' @param x matrix or data frame of measures, should include column names
#' @param observe if TRUE, wait for user to press enter through each step
#' @import car
#' @export
Stats.StandardANOVAPractice = function(y, x, observe = TRUE, Thres.Normality = 0.05, Thres.Homogeneity = 0.05, Thres.Decision = 0.05)
{
  if (!is.factor(y)) stop("y is not a factor")
  Results = data.frame(Variable = character(0), Test.Normality = character(0), Test.Homogeneity = character(0), Test.Used = character(0), P.Value = numeric(0), Significant.Pairs = character(0))
  test_out = list()
  for (i in 1:ncol(x)){
    cat("\n ", colnames(x)[i])
    if (!is.numeric(x[,i])){print("not numeric; next"); next}
    if (observe) invisible(readline("; press enter"))
    TestData = data.frame(y, x[,i]); colnames(TestData) = c("Group", "Variable")
    
    aov_res = aov(Variable ~ Group, data = TestData)
    # check normality
    if (observe) invisible(readline("Check normality; press enter"))
    Shapiro = shapiro.test(residuals(aov_res))
    print(Shapiro)
    plot(aov_res,2)
    
    # check homogeneity
    if (observe) invisible(readline("Check homogeneity; press enter"))
    plot(aov_res, 1)
    Levene = car::leveneTest(Variable ~ Group, data = TestData)
    print(Levene)
    
    # appropriate test
    if (observe) invisible(readline("Run test; press enter"))
    if (Shapiro$p.value > Thres.Normality & Levene$`Pr(>F)`[1] > Thres.Homogeneity)
      {cat("\n use ANOVA \n")
      test_out = aov_res # ANOVA when both pass
      Test.Used = "ANOVA"; P.Value = summary(aov_res)[[1]][["Pr(>F)"]][1]
    }else if (Shapiro$p.value < Thres.Normality)
      {cat("\n use KW test \n")
      test_out = kruskal.test(Variable ~ Group, data = TestData) # KW test when non-normal 
      Test.Used = "Kruskal-Wallis"; P.Value = test_out$p.value
    }else
      {cat("\n use Welch one-way \n")
      test_out = oneway.test(Variable ~ Group, data = TestData) # Welch One way when normal but non-homo
      Test.Used = "Welch one-way"; P.Value = test_out$p.value
    }
    print(test_out)
    
    # save results
    Tukey = TukeyHSD(aov_res)
    if (P.Value > Thres.Decision){
      Signif.Pairs = ""
    }else{
      Signif.Pairs = rownames(Tukey$Group)[Tukey$Group[,2] * Tukey$Group[,3] < 0]
    }
    Results = rbind(Results, 
                    data.frame (Variable = colnames(x)[i],
                                Test.Normality = ifelse(Shapiro$p.value > Thres.Normality, "pass", "fail"),
                                Test.Homogeneity = ifelse(Levene$`Pr(>F)`[1] > Thres.Homogeneity, "pass", "fail"),
                                Test.Used = Test.Used,
                                P.Value = P.Value,
                                Significant.Pairs = paste(Signif.Pairs, collapse = "; ")
                    )
    )

  }
  return(list(Results = Results, test_out = test_out))
}
