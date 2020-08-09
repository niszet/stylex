
# wrapper of xml_structure
print_style_strucre <- function(xml){
  utils::capture.output(xml2::xml_structure(xml))
}


# wrapper of data.tree
print_style_tree <- function(xml){
  data.tree::as.Node(xml)
}

