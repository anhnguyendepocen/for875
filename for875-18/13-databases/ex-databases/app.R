# ui.R file
# Databases Exercises

library(shiny)
library(MonetDBLite)
library(DBI)
library(dplyr)

dbdir <- "~/Documents/01-summer2018/01-for875Exercises/16-monetDB"
con <- dbConnect(MonetDBLite::MonetDBLite(), dbdir)

battingTable <- tbl(con, "batting")
baseballTable <- tbl(con, "baseball")

# Obtain the highest HR for a single season for HR slider
maxHR <- battingTable %>% 
  select(hr) %>% 
  summarize(value = max(hr)) %>% 
  collect()

ui <- fluidPage(
  
  titlePanel("Baseball Statistics Search"),
  
  sidebarLayout(
    sidebarPanel(
      sliderInput("rangeHR",
                  label = "Number of Home Runs:",
                  min = 0,
                  max = maxHR$value, 
                  value = c(0, maxHR$value),
                  step = 1),
      
      numericInput("runInput", 
                   label = "Minimum Number of Runs",
                   value = 1),
      numericInput("rbiInput", 
                   label = "Minimum Number of RBIs",
                   value = 1),
      numericInput("yearInput",
                   label = "Year",
                   value = ''),
      checkboxInput("yearCheckbox",
                    label = "Use all years",
                    value = TRUE),
      submitButton("Submit")
    ), 
    mainPanel(
      # Create a new row for the table
      fluidRow(
        DT::dataTableOutput("table")
      )
    )
  )
)

server <- function(input, output) {
  
  output$table <- DT::renderDataTable(DT::datatable({
    data <- battingTable %>% 
      inner_join(baseballTable) %>% 
      select(namefirst, namelast, yearid, hr, rbi, r) %>% 
      filter(hr >= input$rangeHR[1] & hr <= input$rangeHR[2] &
               r >= input$runInput & rbi >= input$rbiInput & 
               (input$yearCheckbox | yearid == input$yearInput)) %>% 
      arrange(desc(hr))
    data <- as.data.frame(data)
    names(data) <- c("First Name", "Last Name", "Year", "HR", "RBI", "R")
    data
  }))
}

# Create Shiny app ----
shinyApp(ui = ui, server = server)