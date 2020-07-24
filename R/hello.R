# test code.
hello <- function(){
file = "sample.docx"
xml <- read_style_xml(file)
style_xml <- get_style_tags(xml)
# node <- get_node_by_id(style_xml, "1")
node <- get_node_by_name(style_xml, "Date")
# node <- get_node_by_name(style_xml, "heading 5")
#View(node)


set_r_sz_val(node, "42")
set_r_color_themecolor(node, "accent2")
set_p_spacing_before(node, 2000)
set_r_b(node, T)
write_style(xml, file, "aaa.docx")

d <- style2df(style_xml)
d[d$style_id=="1","r_sz_val"] <- "400"

xml <- update_xml(file, d)
}



