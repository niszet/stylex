# ----------
# Read and Write xml style file.
# ----------

read_style_xml <- function(file){
  tmpdir = fs::file_temp()
  officer::unpack_folder(file = file, folder = tmpdir)
  xml2::read_xml(fs::path_abs(fs::path(tmpdir, "word/styles.xml")))
}

get_style_tags <- function(xml){
  style_all <- xml2::xml_find_all(xml, "/w:styles/w:style")
}

write_style <- function(style_xml, org_docx, new_docx){

  tmpdir = fs::file_temp()
  officer::unpack_folder(file = org_docx, folder = tmpdir)
  # x = xml2::read_xml(fs::path_abs(fs::path(tmpdir, "word/styles.xml")))
  # style_all <- xml2::xml_find_all(x, "/w:styles/w:style")

  xml2::write_xml(style_xml, fs::path_abs(fs::path(tmpdir, "word/styles.xml")), format="format_whitespace")
  officer::pack_folder(new_docx, folder = tmpdir)

  fs::dir_delete(tmpdir)
}

