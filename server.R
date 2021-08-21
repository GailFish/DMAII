library(shiny)

server <- function(input, output, session) {
  
  
  power <- reactive({
    
    alpha <- as.numeric(input$alpha)
    
    kx <- input$grps - 1
    
    ky <- input$dv
    
    N <- input$grps * input$grp_sz
    
    u <- ky*kx
    
    s <- ifelse(ky^2*kx^2 == 4,  1, sqrt((ky^2*kx^2-4)/(ky^2+kx^2-5))) 
    
    m <- N-(ky + kx + 3)/2
    
    v <- u + s*m
    
    lambda <- input$effect*(u + v + 1) #non centrality parameter for testing f-distribution
    
    cval <- qf(1-alpha, u, v) 
    
    pwr <- round(pf(q = cval,df1 = u, df2 = v, ncp = lambda, lower.tail = F),4)
    
  })
  
  output$power <- renderText({ 
    
    power()
  })
  
  
}