library(shiny)

shinyUI(
  navbarPage("A Shiny Application that Estimates MPG of a viechle",
             tabPanel("Analysis",
                      fluidPage(
                        titlePanel("The relationship between variables and miles per gallon (MPG)"),
                        sidebarLayout(
                          sidebarPanel(
                            selectInput("variable", "Variable:",
                                        c("Number of cylinders" = "cyl",
                                          "Displacement (cu.in.)" = "disp",
                                          "Gross horsepower" = "hp",
                                          "Rear axle ratio" = "drat",
                                          "Weight (lb/1000)" = "wt",
                                          "1/4 mile time" = "qsec",
                                          "V/S" = "vs",
                                          "Transmission" = "am",
                                          "Number of forward gears" = "gear",
                                          "Number of carburetors" = "carb"
                                        )),
                            
                            checkboxInput("outliers", "Show BoxPlot's outliers", FALSE)
                          ),
                          
                          mainPanel(
                            h3(textOutput("caption")),
                            
                            tabsetPanel(type = "tabs", 
                                        tabPanel("BoxPlot", plotOutput("mpgBoxPlot")),
                                        tabPanel("Regression model", 
                                                 plotOutput("mpgPlot"),
                                                 verbatimTextOutput("fit")
                                        )
                            )
                          )
                        )
                      )
             ),
             tabPanel("Documentation: Background Information",
                      h2("Description"),
                      helpText("The data was extracted from the 1974 Motor Trend US magazine,",
                               " and comprises fuel consumption and 10 aspects of automobile design and performance",
                               " for 32 automobiles (1973–74 models)."),
                      h3("Variables in the dataset"),
                      p("A data frame with 32 observations on 11 variables."),
                      
                      p("  mpg: Miles/(US) gallon"),
                      p("  cyl: Number of cylinders"),
                      p("  disp: Displacement (cu.in.)"),
                      p("  hp: Gross horsepower"),
                      p("  drat: Rear axle ratio"),
                      p("  wt: Weight (lb/1000)"),
                      p("  qsec	 1/4 mile time"),
                      p("  vs: V/S"),
                      p("  am: Transmission (0 = automatic, 1 = manual)"),
                      p("  gear: Number of forward gears"),
                      p("  carb: Number of carburetors")
             ),
             
             tabPanel("Git Repository for this App",
                      a("https://github.com/karenlqy/Develop-Data-Products"),
                      hr()
                      
             )
  )
)