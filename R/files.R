#' Extract styles.xml file in the docx file
#'
#' @param file Input file path of reference document file (docx).
#'
#' @return node object of xml2 which contains all tags in styles.xml file.
#' @export
#'
#' @examples
#'
#' \dontrun{
#'   read_style_xml("reference.docx")
#' }
#'
read_style_xml <- function(file){
  tmpdir = fs::file_temp()
  officer::unpack_folder(file = file, folder = tmpdir)
  xml2::read_xml(fs::path_abs(fs::path(tmpdir, "word/styles.xml")))
}

#' Extract only style tags and its children
#'
#' @param xml expects xml2 node object which contains tags from styles.xml such as output of `read_style_xml`.
#'
#' @return xml2 node object which contains style tags.
#' @export
#'
#' @examples
#' \dontrun{
#' get_style_tags(xml)
#' }
get_style_tags <- function(xml){
  xml2::xml_find_all(xml, "/w:styles/w:style")
}

#' Write docx file with original reference.docx and updated style xml
#'
#' @param style_xml updated style xml node object.
#' @param org_docx original reference.docx file name as a character.
#' @param new_docx updated docx file name as a character.
#'
#' @return None
#' @export
#'
#' @examples
#' \dontrun{
#'   write_style(xml, "reference.docx", "updated.docx")
#' }
#'
write_style <- function(style_xml, org_docx, new_docx){

  tmpdir = fs::file_temp()
  officer::unpack_folder(file = org_docx, folder = tmpdir)
  # x = xml2::read_xml(fs::path_abs(fs::path(tmpdir, "word/styles.xml")))
  # style_all <- xml2::xml_find_all(x, "/w:styles/w:style")

  xml2::write_xml(style_xml, fs::path_abs(fs::path(tmpdir, "word/styles.xml")), format="format_whitespace")
  officer::pack_folder(new_docx, folder = tmpdir)

  fs::dir_delete(tmpdir)
}

