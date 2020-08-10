#' Extract styles.xml file in the docx file
#'
#' @param file Input file path of reference document file (docx).
#'
#' @return `node_document` object which contains all tags in styles.xml file.
#' @export
#'
#' @examples
#'
#' \dontrun{
#'   read_docx("reference.docx")
#' }
#'
read_styles <- function(file){
  tmpdir = fs::file_temp()
  officer::unpack_folder(file = file, folder = tmpdir)
  x <- xml2::read_xml(fs::path_abs(fs::path(tmpdir, "word/styles.xml")))

  fs::dir_delete(tmpdir)

  # TODO: all other functions also has addition of clas...
  class(x) <- c("docx_styles", class(x))

  x
}

#' Write docx file with original reference.docx and updated style xml
#'
#' @param styles_xml `xml_node` object with `styles`
#' @param ref_file reference docx file name as a `character`. Use files except `word/styles.xml`.
#' @param new_file new docx file name as a `character`.
#'
#' @return None
#' @export
#'
#' @examples
#' \dontrun{
#'   write_styles(xml, "reference.docx", "updated.docx")
#' }
#'
write_styles <- function(styles_xml, ref_file, new_file){

  if(!all(
    any(class(styles_xml) %in% c("docx_styles")),
    any(class(styles_xml) %in% c("xml_document")))){
    warning("object does not have docx_styles and xml_document classes")
    return(NULL)
  }

  tmpdir = fs::file_temp()
  officer::unpack_folder(file = ref_file, folder = tmpdir)

  xml2::write_xml(styles_xml,
                  fs::path_abs(fs::path(tmpdir, "word/styles.xml")),
                  format="format_whitespace")

  officer::pack_folder(new_file, folder = tmpdir)

  fs::dir_delete(tmpdir)
}

