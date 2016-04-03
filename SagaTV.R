library(RSelenium)
library(rvest)
library(reshape2)
library(stringr)
library(dplyr)
library(ggplot2)


setwd("D:\\RCoursera\\Saga_falabella")

#start RSelenium
checkForServer()
startServer()
remDr <- remoteDriver()
remDr$open()


#Página 1
#navigate to your page
remDr$navigate("http://www.falabella.com.pe/falabella-pe/category/cat1450502/Smart-TV?navAction=push")


page_source<-remDr$getPageSource()



#Marca




product_info <- function(node){
        
        s.marca <- html_nodes(node,"div.marca a") %>% html_text
        s.producto <- html_nodes(node,"div.detalle a") %>% html_text
        s.precio.internet <- html_nodes(node, "div.precio2 span") %>% html_text
        s.precio.unica <- html_nodes(node, "div.precio1 span") %>% html_text 
        s.precio.normal <- html_nodes(node, "div.precio3 span") %>% html_text 
        s.recojo.tienda <- html_nodes(node, ".ico_cuatro") %>% html_text 
        s.solo.online <- html_nodes(node, ".ico_dos") %>% html_text
        
        
        s.precio.internet <-   gsub("\\S\\/\\. ", "", s.precio.internet)
        s.precio.unica <-   gsub("\\S\\/\\. ", "", s.precio.unica)
        s.precio.normal <-   gsub("\\S\\/\\. ", "", s.precio.normal)
        
        data.frame(
                ecommerce = "falabella",
                marca = s.marca,
                producto = s.producto,
                precio.normal = ifelse(length(s.precio.normal) == 0, NA, s.precio.normal),
                precio.internet = ifelse(length(s.precio.internet) == 0, NA, s.precio.internet),
                precio.unica = s.precio.unica,
                recojo.tienda = ifelse(length(s.recojo.tienda) == 0, NA, s.recojo.tienda),
                solo.online = ifelse(length(s.solo.online) == 0, NA, s.solo.online),
                stringsAsFactors=F
        )
        
        
}



doc <- read_html(iconv(page_source[[1]]), to="UTF-8") %>% 
        html_nodes(".cajaLP4x")




s.tv.pag1 <- lapply(doc, product_info) %>%
              rbind_all






####





########################################


##### Saga SmartTV - Page 2

#paginador > a:nth-child(2)

saga.smart.tv.pag2 <- remDr$findElement(
        using = 'css', 
        value = "#paginador > a:nth-child(2)")

saga.smart.tv.pag2$clickElement()

Sys.sleep(10)


page_source<-remDr$getPageSource()


##############@################
#â¥2 
#################################

product_info <- function(node){
        
        s.marca <- html_nodes(node,"div.marca a") %>% html_text
        s.producto <- html_nodes(node,"div.detalle a") %>% html_text
        s.precio.internet <- html_nodes(node, "div.precio2 span") %>% html_text
        s.precio.unica <- html_nodes(node, "div.precio1 span") %>% html_text 
        s.precio.normal <- html_nodes(node, "div.precio3 span") %>% html_text 
        s.recojo.tienda <- html_nodes(node, ".ico_cuatro") %>% html_text 
        s.solo.online <- html_nodes(node, ".ico_dos") %>% html_text
        
        
        s.precio.internet <-   gsub("\\S\\/\\. ", "", s.precio.internet)
        s.precio.unica <-   gsub("\\S\\/\\. ", "", s.precio.unica)
        s.precio.normal <-   gsub("\\S\\/\\. ", "", s.precio.normal)
        
        
        data.frame(
                ecommerce = "falabella",
                marca = s.marca,
                producto = s.producto,
                precio.normal = ifelse(length(s.precio.normal) == 0, NA, s.precio.normal),
                precio.internet = ifelse(length(s.precio.internet) == 0, NA, s.precio.internet),
                precio.unica = s.precio.unica,
                recojo.tienda = ifelse(length(s.recojo.tienda) == 0, NA, s.recojo.tienda),
                solo.online = ifelse(length(s.solo.online) == 0, NA, s.solo.online),
                stringsAsFactors=F
        )
        
        
}



doc <- read_html(iconv(page_source[[1]]), to="UTF-8") %>% 
        html_nodes(".cajaLP4x")




s.tv.pag2 <- lapply(doc, product_info) %>%
        rbind_all


##############@################
# 53333333333333333333333333333333333333
#################################





##### Saga SmartTV - Page 3



saga.smart.tv.pag3 <- remDr$findElement(
        using = 'css', 
        value = "#paginador > a:nth-child(3)")

saga.smart.tv.pag3$clickElement()

Sys.sleep(10)


page_source<-remDr$getPageSource()


#####################################
#####################################




product_info <- function(node){
        
        s.marca <- html_nodes(node,"div.marca a") %>% html_text
        s.producto <- html_nodes(node,"div.detalle a") %>% html_text
        s.precio.internet <- html_nodes(node, "div.precio2 span") %>% html_text
        s.precio.unica <- html_nodes(node, "div.precio1 span") %>% html_text 
        s.precio.normal <- html_nodes(node, "div.precio3 span") %>% html_text 
        s.recojo.tienda <- html_nodes(node, ".ico_cuatro") %>% html_text 
        s.solo.online <- html_nodes(node, ".ico_dos") %>% html_text
        
        
        s.precio.internet <-   gsub("\\S\\/\\. ", "", s.precio.internet)
        s.precio.unica <-   gsub("\\S\\/\\. ", "", s.precio.unica)
        s.precio.normal <-   gsub("\\S\\/\\. ", "", s.precio.normal)
        
        
        
        data.frame(
                ecommerce = "falabella",
                marca = s.marca,
                producto = s.producto,
                precio.normal = ifelse(length(s.precio.normal) == 0, NA, s.precio.normal),
                precio.internet = ifelse(length(s.precio.internet) == 0, NA, s.precio.internet),
                precio.unica = s.precio.unica,
                recojo.tienda = ifelse(length(s.recojo.tienda) == 0, NA, s.recojo.tienda),
                solo.online = ifelse(length(s.solo.online) == 0, NA, s.solo.online),
                stringsAsFactors=F
        )
        
        
}



doc <- read_html(iconv(page_source[[1]]), to="UTF-8") %>% 
        html_nodes(".cajaLP4x")




s.tv.pag3 <- lapply(doc, product_info) %>%
        rbind_all




### 4

##### Saga SmartTV - Page 4



saga.smart.tv.pag4 <- remDr$findElement(
        using = 'css', 
        value = "#paginador > a:nth-child(4)")

saga.smart.tv.pag4$clickElement()

Sys.sleep(10)


page_source<-remDr$getPageSource()


#####################################
#####################################




product_info <- function(node){
        
        s.marca <- html_nodes(node,"div.marca a") %>% html_text
        s.producto <- html_nodes(node,"div.detalle a") %>% html_text
        s.precio.internet <- html_nodes(node, "div.precio2 span") %>% html_text
        s.precio.unica <- html_nodes(node, "div.precio1 span") %>% html_text 
        s.precio.normal <- html_nodes(node, "div.precio3 span") %>% html_text 
        s.recojo.tienda <- html_nodes(node, ".ico_cuatro") %>% html_text 
        s.solo.online <- html_nodes(node, ".ico_dos") %>% html_text
        
        s.precio.internet <-   gsub("\\S\\/\\. ", "", s.precio.internet)
        s.precio.unica <-   gsub("\\S\\/\\. ", "", s.precio.unica)
        s.precio.normal <-   gsub("\\S\\/\\. ", "", s.precio.normal)
        
        
        data.frame(
                ecommerce = "falabella",
                marca = s.marca,
                producto = s.producto,
                precio.normal = ifelse(length(s.precio.normal) == 0, NA, s.precio.normal),
                precio.internet = ifelse(length(s.precio.internet) == 0, NA, s.precio.internet),
                precio.unica = s.precio.unica,
                recojo.tienda = ifelse(length(s.recojo.tienda) == 0, NA, s.recojo.tienda),
                solo.online = ifelse(length(s.solo.online) == 0, NA, s.solo.online),
                stringsAsFactors=F
        )
        
        
}



doc <- read_html(iconv(page_source[[1]]), to="UTF-8") %>% 
        html_nodes(".cajaLP4x")




s.tv.pag4 <- lapply(doc, product_info) %>%
        rbind_all









##### Unir Data Frames ######

### Saga no utiliza los puntos decimales




s.tv <- rbind(s.tv.pag1,s.tv.pag2,s.tv.pag3)


s.tv <- as.data.frame(apply(s.tv[,],2,tolower))






################################################???



# saga.smart.tv <- saga.smart.tv %>%
#         mutate(rangos = ifelse(precio.nuevo <= 500, "< S/.500",
#                                ifelse(precio.nuevo > 500 & precio.nuevo <= 1500,
#                                       "S/.500 - S/.1500",
#                                       ifelse(precio.nuevo > 1500 & precio.nuevo <= 2500,"S/.1500 - S/.2500",
#                                              ifelse(precio.nuevo > 2500 & precio.nuevo <= 3500,"S/.2500 - S/.3500",
#                                                     ifelse(precio.nuevo > 3500 & precio.nuevo <= 4500,"S/.3500 - S/.4500",
#                                                            "> S/.4,500"))))))
# 
# 
# 
# 
# 
# 
# saga.smart.tv$precio.internet <- ifelse(is.na(saga.smart.tv$precio.internet) == T,
#                                        saga.smart.tv$precio.nuevo, saga.smart.tv$precio.internet)
# 
# 
# 
# saga.smart.tv <- saga.smart.tv[!duplicated(saga.smart.tv),]
# 
# 
# 
# 
# saga.smart.tv <- as.data.frame(apply(saga.smart.tv[,],2,toupper))


s.tv$pulgadas <- sub(".*?(\\d+['\"]).*", "\\1", s.tv$producto)
s.tv$pulgadas <- sub('"', "", s.tv$pulgadas)
s.tv$pulgadas <- sub("'", "", s.tv$pulgadas)


#####################################################################
#####################################################################



file <- paste("s-tv", as.character(Sys.Date()), sep = "-")

s.tv.csv <- paste(file, "csv", sep = ".")


write.csv(s.tv, s.tv.csv, row.names = F)












