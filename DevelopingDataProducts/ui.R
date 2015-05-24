library(shiny)

doc <- "Simply enter your height below and comparisons of your height with the\
 height of men and women in the United States will appear on the right."

src1 <- "Means and standard deviations of height of American men and women\
 used by this application are taken from the paper "

src2 <- a( href="http://www.biostat.jhsph.edu/bstcourse/bio751/papers/bimodalHeight.pdf",
         "'Is Human Height Bimodal?'" )

src3 <- "by Schilling, Watkins, and Watkins, published in The American Statistician, August 2002, Vol. 56, No. 3.\
 The means and standard deviations were calculated from data published\
 by the U.S. National Health and Nutrition Examination Survey for subjects in the\
 20-29 age bracket and were found to follow the normal distribution."

statTable <- HTML( "<table border=1 style='width:100%'>
 <caption>Table: Mean and SD of Height in Inches</caption>
 <tr><th></th><th> Mean </th><th> SD </th></tr>
 <tr><td> Men </td><td> 69.3 </td><td> 2.92 </td></tr>
 <tr><td> Women </td><td> 64.1 </td><td> 2.75 </td></tr>
              </table>" )

shinyUI( fluidPage(

  titlePanel( HTML( "<center>Height Comparison</center>" ) ,
              windowTitle="Height Comparison" ),
  
  sidebarLayout(
    
    sidebarPanel(
      h3( "Enter Your Height" ),
      h5( doc ),
      numericInput( 'feet' , 'Feet' , 5 , min=0 , max=9 , step=1 ),
      numericInput( 'inches' , 'Inches' , 0 , min=0 , max=11 , step=1 ),
      h5( src1 , src2 , src3 ),
      div( statTable )
    ),
    
    mainPanel(
      h3( "Comparison to American Men" ),
      h4(verbatimTextOutput( 'mp' )),
      plotOutput( 'mPlot' ),
      h3( "Comparison to American Women" ),
      h4(verbatimTextOutput( 'fp' )),
      plotOutput( 'fPlot' )
    )
  
  )

))