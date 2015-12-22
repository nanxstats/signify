library('shiny')
source('include/val.get.R', local = TRUE)
key = readRDS('data/key.rds')
val = readRDS('data/val.rds')

shinyServer(function(input, output) {

  #   get_keyval = eventReactive(input$submit, {
  #     kvlist = val.getn(as.numeric(input$pval))
  #   })

  get_keyval = eventReactive(input$submit, {
    kvlist = val.getone(query = as.numeric(input$pval))
  })

  #   output$keyval = renderDataTable({
  #     keyval = get_keyval()
  #     data.frame('Signified' = keyval$val,
  #                'p-value'   = format(keyval$key, digits = 5))
  #   }, options = list(paging = FALSE, searching = FALSE))

  output$keyval = renderText({
    keyval = get_keyval()
    keyval$val
  })

})
