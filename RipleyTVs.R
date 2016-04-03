library(RSelenium)
library(rvest)
library(reshape2)
library(stringr)


#start RSelenium
checkForServer()
startServer()
remDr <- remoteDriver()
remDr$open()

#navigate to your page
remDr$navigate("http://www.ripley.com.pe/ripley-peru/tv-todas")


page_source<-remDr$getPageSource()

#parse it

TV_Info_page1 <- read_html(iconv(page_source[[1]], to="UTF-8"), encoding = "utf8") %>%
        #xml_structure() %>%
        html_nodes(".product_info") %>%
        html_text()


TV_Info_page1 <-   gsub("\n", "", TV_Info_page1)
TV_Info_page1 <-   gsub("\t", "", TV_Info_page1)




TV_Info_page1 <- colsplit(TV_Info_page1, " ", c("marca","producto","tecnologia","características"))
# 
# TV_Precios <- TV_Info2$características
# head(TV_Precios)
# TV_Precios2 <- gsub("^[^\\S\\/\\.]*","",TV_Precios)
# 
# TV_Precios3 <- gsub("^S ^[0-9]{2}\\$","",TV_Precios2)

# 
# head(TV_Precios2)
# head(TV_Precios3,50)
# 
# dput(TV_Precios2)


#####
rm(page_source)

page2 <- remDr$findElement(
        using = 'css', 
        value = "#WC_SearchBasedNavigationResults_pagination_link_2_categoryResults")

page2$clickElement()


page_source<-remDr$getPageSource()


#parse it

TV_Info_page2 <- read_html(iconv(page_source[[1]], to="UTF-8"), encoding = "utf8") %>%
        #xml_structure() %>%
        html_nodes(".product_info") %>%
        html_text()


TV_Info_page2 <-   gsub("\n", "", TV_Info_page2)
TV_Info_page2 <-   gsub("\t", "", TV_Info_page2)




TV_Info_page2 <- colsplit(TV_Info_page2, " ", c("marca","producto","tecnologia","características"))





#####


page3 <- remDr$findElement(
        using = 'css', 
        value = "#WC_SearchBasedNavigationResults_pagination_link_3_categoryResults")

page3$clickElement()



page_source3 <- remDr$getPageSource()

#parse it

TV_Info_page3 <- read_html(iconv(page_source2[[1]], to="UTF-8"), encoding = "utf8") %>%
        #xml_structure() %>%
        html_nodes(".product_info") %>%
        html_text()


TV_Info_page3 <-   gsub("\n", "", TV_Info_page3)
TV_Info_page3 <-   gsub("\t", "", TV_Info_page3)




TV_Info_page3 <- colsplit(TV_Info_page3, " ", c("marca","producto","tecnologia","características"))






#####



page4 <- remDr$findElement(
        using = 'css', 
        value = "#WC_SearchBasedNavigationResults_pagination_link_4_categoryResults")

page4$clickElement()


#####


page5 <- remDr$findElement(
        using = 'css', 
        value = "#WC_SearchBasedNavigationResults_pagination_link_5_categoryResults")

page5$clickElement()

