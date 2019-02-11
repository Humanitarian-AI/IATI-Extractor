read_organization_xmls<-function(url){

  org_page   <- httr::GET(url) %>% read_html

  n_pages      <- org_page %>% html_nodes("ul.pagination li") %>% html_text %>%
    as.numeric %>% .[complete.cases(.)] %>% length



  all_urls <- lapply(seq(n_pages), FUN = function(a){

    pg     <-  httr::GET(paste(url,"?page=",a,sep = '')) %>% read_html

    xml_urls <- pg %>% html_nodes(".dataset-content a:nth-child(2)") %>% html_attr("href")

    data.table(name      = {
      pg %>% html_nodes(".dataset-heading a") %>% html_text
    },
    xml_url = xml_urls)
  }) %>% rbindlist(fill = TRUE)

  all_urls
}




#' Return xml links by organization
#'
#' Returns a list of two tables: a Publishers table with details on each publisher, and an XMLs table with links to all available xmls with the associated name and publisher.
#' @import magrittr dplyr data.table httr rvest xml2
#' @export
tableXMLs<-function(filepath = NULL){

  pub       <- httr::GET("https://iatiregistry.org/publisher") %>% read_html

  links     <- pub

  tbl       <- pub %>% html_table(fill = TRUE) %>% as.data.table
  tbl$links <- pub %>% html_nodes("table a") %>% html_attr("href") %>%
    paste("https://iatiregistry.org",., sep = "")


  xml_list <- lapply(tbl$links, read_organization_xmls)
  names(xml_list)<-tbl$Publisher
  xml_table<-xml_list %>% rbindlist(fill = TRUE, idcol = "Publisher")

  results<-list(Publishers = tbl,
                XMLs       = xml_table)
  if(!is.null(filepath)){
    a<-lapply(names(results), FUN = function(res){
      fwrite(file = res,x = results[[res]])
      cat("Written to ", res,"\n")

    })
  }

  results

}



















