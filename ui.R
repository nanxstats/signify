library('shiny')
library('markdown')

shinyUI(fluidPage(

  title = 'Signify',
  theme = 'flatly.css',

  fluidRow(column(12, div(style = 'height: 200px;'))),

  fluidRow(

    fluidRow(

      column(8, offset = 2,
             h1('Signify'),
             tags$style(type = 'text/css', 'h1 { font-size: 60px; }')
      )

    ),

    fluidRow(column(12, div(style = 'height: 10px;'))),

    fluidRow(

      column(4, offset = 2,
             textInput('pval', 'Your p-value:', value = 0.051, width = '100%')
      ),

      column(4, offset = 0,
             actionButton('submit', 'Signify', icon = icon('check'),
                          class = 'btn-success'),
             tags$style(type='text/css', '#submit { width:100%; margin-top: 25px;}')
      )

    ),

    #     fluidRow(
    #       column(6, offset = 3,
    #              dataTableOutput('keyval')
    #       )
    #     ),

    fluidRow(

      column(8, offset = 2,
             h2(textOutput('keyval')),
             tags$style(type = 'text/css', 'h2 { font-size: 40px; }')
      )

    ),

    fluidRow(

      column(8, offset = 2,
             includeMarkdown('help/footer.md')
      )

    )

  )

))
