library(shiny)


ui <- fluidPage(
  
  # Application title
  titlePanel("MANOVA Power Calculator"),
  
  sidebarLayout(
    
    mainPanel(
      
      p("Here is a quick estimated power calculator for MANOVA analyses. The following calculator uses Cohen's (1988) power calculations.
              This calculation can be used for one-way MANOVA analyses. It is an omnibus test for whether a set of variables jointly separates groups of interest within a single grouping variable."
        
      ),
      
      p("For groups, select the number of categories in your grouping variable."),
      
      p("Next select the number of observations you plan to have in EACH group. This early version of the power calculator only allows for equal sized groups. 
          Keep in mind that homogeneity of variance is a statistical assumption for MANOVAs, and violations tend to be less robust when groups are not of equal size."),
      
      p("Statistical power can only be evaluated at a given alpha-level, and you can change this in your calculation. The default is at 0.05."),
      
      p("Statistical power is also calculated for a given effect size.
          This calculator uses Cohen's (1988) f-squared. 
          This is a measure which takes into account correlations, the number of groups, number of dependent variables, and likelihood ratio of determinants for observed sample results.
          As a rule-of-thumb:"),
      strong(" 0.02 is a small effect size; 0.15 is a medium effect size, and 0.35 is a large effect size."),
      p("Note that in the social sciences, effect sizes are typically small-to-medium, so choose wisely.")
      
      
    ),
    
    sidebarPanel(   
      
      sliderInput("grps", "How many groups does your data have?", min = 2, max = 15, value = 2),
      
      sliderInput("dv", "How many dependent variables does your data have?", min = 2, max = 15, value = 2),
      
      numericInput("grp_sz", "How many observations are in each group?", 25, min = 1, max = 100000, step = 1),
      
      radioButtons("alpha", "What alpha level are you testing?", 
                   choices = list("0.001", "0.01", "0.025", "0.05", "0.10"),
                   selected = "0.05"), 
      numericInput("effect", "What effect size do you expect?", 0.02, min = 0, max = 1),
      h2("The estimated power is", textOutput("power")),
      
    )
  )
  
  
)