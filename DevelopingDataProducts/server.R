library(shiny)

# Means and standard deviations of height of American men and women used by this 
# function are taken from the paper 'Is Human Height Bimodal?' by Schilling, 
# Watkins, and Watkins, published in The American Statistician, August 2002, 
# Vol. 56, No. 3.  The means and standard deviations were calculated from data 
# published by the U.S. National Health and Nutrition Examination Survey for 
# subjects in the 20-29 age bracket and were found to follow the normal 
# distribution.  The paper is available at 
# http://www.biostat.jhsph.edu/bstcourse/bio751/papers/bimodalHeight.pdf

mmean <- 69.3
msd   <-  2.92
fmean <- 64.1
fsd   <-  2.75

ht <- function(input) { 12*input$feet + input$inches }

hText <- function(input) { 
  paste( input$feet, "'", input$inches, "\"", sep="")
}

shinyServer(
  
  function(input, output) {
    
    result <- function(input, mean, sd, gender) {
      renderText({
        
        p <- paste(
          round(
            100*pnorm( ht(input) , mean , sd ) ,
            digits=1
          )
        )
        
        paste( "At " ,
               hText(input) ,
               ", you are taller than " , 
               switch(
                 p,
                 "0" = "almost no",
                 "100" = "almost all",
                 paste( "about " , p , "% of" , sep="" )
               ) ,
               " American " ,
               gender ,
               sep=""
             )
      })
    }
    
    output$mp <- result(input, mmean, msd, "men")
    output$fp <- result(input, fmean, fsd, "women")
    
    
    normalPlot <- function(input, mean, sd, gender) {
      renderPlot({
        h <- ht(input)
        plot( function(x) dnorm(x, mean, sd), 
              50, 85, 
              ylab="", yaxt="n",
              xlab="Height (inches)",
              main=paste( "Density of American ", gender, "'s Height", sep="" )
        )
        abline( v=h, col="red" )
        text( h , 0.75*dnorm(mean, mean, sd), hText(input), pos=4, col="red")
      })
    }
    
    output$mPlot <- normalPlot(input, mmean, msd, "Men")
    output$fPlot <- normalPlot(input, fmean, fsd, "Women")
  }
  
)