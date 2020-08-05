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
read_docx <- function(file){
  tmpdir = fs::file_temp()
  officer::unpack_folder(file = file, folder = tmpdir)
  xml2::read_xml(fs::path_abs(fs::path(tmpdir, "word/styles.xml")))

  fs::dir_delete(tmpdir)
}

#' Write docx file with original reference.docx and updated style xml
#'
#' @param styles_xml `xml_node` object with `styles`
#' @param org_docx reference docx file name as a `character`. Use files except `word/styles.xml`.
#' @param new_docx new docx file name as a `character`.
#'
#' @return None
#' @export
#'
#' @examples
#' \dontrun{
#'   write_docx(xml, "reference.docx", "updated.docx")
#' }
#'
write_docx <- function(styles_xml, org_docx, new_docx){

  tmpdir = fs::file_temp()
  officer::unpack_folder(file = org_docx, folder = tmpdir)

  xml2::write_xml(styles_xml,
                  fs::path_abs(fs::path(tmpdir, "word/styles.xml")),
                  format="format_whitespace")

  officer::pack_folder(new_docx, folder = tmpdir)

  fs::dir_delete(tmpdir)
}

