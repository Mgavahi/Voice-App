# Import required libraries ----
library(shiny)

# Define UI for draw plot
shinyUI(
    fluidPage(
        # Add title and image ----
        titlePanel(
            title = h2(
                img(src = "graphic.png", height = 50, width = 50, align = "center"),
                div("Voice App", style = "color:blue"), align = "center"),
            windowTitle = "VoiceApp"),
        # Add annyang ----
        singleton(tags$head(
            tags$script(src="//cdnjs.cloudflare.com/ajax/libs/annyang/1.4.0/annyang.min.js"),
            ## Adding GUI button ----
            # tags$script(src="//cdnjs.cloudflare.com/ajax/libs/SpeechKITT/0.3.0/speechkitt.min.js"),
            includeScript('init.js')
        )),
        sidebarLayout(
            # Define Sidebar ----
            sidebarPanel(
                # adding image sidebar ----
                img(src = "graphic.png", height = 30, width = 30," Fibunacci"),
                hr(),
                # adding help text sidebar ----
                helpText(div("Help:", style = "color:  #df2029 ")),
                helpText(
                    HTML("<li> Use <font color='#8e44ad'>Google Chrome</font> Browser to play App.</br> </li>",
                         "<li> To change the title, you must say somthing that start with 
                         <font color = '#e51400'> title</font> . </br>",
                         "<font color = '#410093'> Example : title hello world</font> . </br> </li>",
                         "<li> To change the color of points plot, you must say somthing that
                         starts with <font color = '#e51400'> color</font>.</br>",
                         "<font color = '#410093'> Example : color red</font> . </br> </li>",
                         "<li> To add Regression line , say 
                          <font color = '#e51400'> regression </font> . </br>",
                         "<font color = '#410093'> Example : regression</font> . </br> </li>",
                         "<li> To make the points plot bigger or smaller, say 
                         <font color = '#e51400'> bigger </font> or 
                         <font color = '#e51400'> smaller </font> . </br>",
                         "<font color = '#410093'> Example : bigger</font> . </br>",
                         "<font color = '#410093'> Example : smaller</font> . </br> </li>",
                         "<hr size=”10″ noshade> ",
                         "Connect Us: <a hrefhttps://virgool.io/@fibunacci>Fibunacci</a>"
                    ))
                
            ),
            # Define Main panel ----
            mainPanel(
                # plot output ----
                plotOutput("voicePlot")
            )
        )
    )
)

