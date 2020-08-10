
<!-- README.md is generated from README.Rmd. Please edit that file -->

stylex
======

<!-- badges: start -->

[![Codecov test
coverage](https://codecov.io/gh/niszet/stylex/branch/master/graph/badge.svg)](https://codecov.io/gh/niszet/stylex?branch=master)
[![Travis build
status](https://travis-ci.com/niszet/stylex.svg?branch=master)](https://travis-ci.com/niszet/stylex)
[![Travis build
status](https://travis-ci.org/niszet/stylex.svg?branch=master)](https://travis-ci.org/niszet/stylex)
<!-- badges: end -->

\*\* NOTE \*\* This package is under an experimental phase. It is still
under developping…

`stylex` is an R package to modify style setting in docx file. This is
especially for Pandoc’s docx input aka `reference.docx`. But any other
docx file can be used.

`stylex` package acts as a wrapper functions of `xml2`. This helps you
to modify the style object without knowledge of xml2 package behaviour.

Installation
------------

You can install `stylex` package from
[GitHub](https://github.com/niszet/stylex) with:

    remotes::install_github("niszet/stylex")
    # or
    devtools::install_github("niszet/stylex")

Example 1
---------

`stylex` package provides a way to modify docx file through a
data.frame. By changing data.frame, many styles in target file can be
modified simultaneously.

    library(stylex)

    # set the complete file path
    ref_file = "sample.docx"

    # get docx_styles object (styles_node) from style.xml in the docx
    style_xml <- read_styles(ref_file)

    # transform docx_styles to data.frame format.
    d <- style2df(style_xml)

    # try to modify by specifing style_id and column name.
    d[d$style_id=="1","r_pr_sz_val"] <- "400"

    # update docx_style by updated data.frame.
    xml <- update_styles_from_df(style_xml, d)

    # write the modified docx file.
    write_style(xml, ref_file, "modified.docx")

Example 2
---------

Internally, `stylex` package uses functions to each tags in docx file.
Users can use these functions by calling with `:::` because these are
internal functions.

    library(stylex)

    ref_file = "sample.docx"
    style_xml <- read_styles(ref_file)

    # node extract by tag name of "Date".
    node <- get_node_by_name(style_xml, "Date")

    # users can identify the node by style_id.
    # This is more adequate because id is unique in the docx.
    # node <- get_node_by_id(style_xml, "1")

    # by name, you must write that exactly, i.e. white spaces.
    # node <- get_node_by_name(style_xml, "heading 5")

    # Set the value by function.
    # When node object changes, original xml object is also changed.
    stylex:::set_node_tagattr(node, val="42", tag="w:rPr/w:sz", attr="val")
    stylex:::set_node_tagattr(node, val="accent2", tag="w:rPr/w:color", attr="themecolor")
    stylex:::set_node_tagattr(node, val="2000", tag="w:rPr/w:spacing", attr="before")
    stylex:::set_node_tagattr(node, val=TRUE, tag="w:rPr/w:b")

    write_style(xml, ref_file, "modified.docx")

Example 3
---------

`stylex` package can create new style based on existing style. Now
`create_new_style` is non-exported function.

    library(stylex)

    file = "sample.docx"
    styles_node <- read_styles(file)

    node <- get_node_by_name(styles_node, "Author")
    stylex::copy_style_from_node(node, "Author_based_new_style")

    stylex::add_style_to_styles(styles_node, node)

node structure
==============

Prepare
-------

You can see the structure of xml node/node\_set object by
`xml2::xml_structure()` function as following

    > xml2::xml_structure(node)
    [[1]]
    <style [type, styleId]>
      <name [val]>
      <basedOn [val]>
      <next [val]>
      <uiPriority [val]>
      <qFormat>
      <pPr>
        <keepNext>
        <keepLines>
        <spacing [before, after]>
        <outlineLvl [val]>
      <rPr>
        <rFonts [asciiTheme, eastAsiaTheme, hAnsiTheme, cstheme]>
        <b>
        <bCs>
        <color [val, themeColor]>
        <sz [val]>
        <szCs [val]>

This function will be imcorporated into `stylex` package.

To see nodes of styles
======================

    # Because the node is an object of xml2, prior to View it load xml2 package.

    library(xml2)
    View(node)

Tag and its attributes
======================

`stylex` can modify several tags and its attributes. You can get the
full list of pair of tags and its attributes via `stylex:::TAGATTRLIST`.

    head(stylex:::TAGATTRLIST)
    #> [[1]]
    #> [1] NA     "type"
    #> 
    #> [[2]]
    #> [1] "w:name" "val"   
    #> 
    #> [[3]]
    #> [1] NA        "styleId"
    #> 
    #> [[4]]
    #> [1] NA            "customStyle"
    #> 
    #> [[5]]
    #> [1] NA        "default"
    #> 
    #> [[6]]
    #> [1] "w:link" "val"

You can also get the above list as a data.frame via
`stylex:::TAGATTRDF`.

    head(stylex:::TAGATTRDF)
    #>           name    tag        attr
    #> 1         type   <NA>        type
    #> 2     name_val w:name         val
    #> 3     style_id   <NA>     styleId
    #> 4 custom_style   <NA> customStyle
    #> 5      default   <NA>     default
    #> 6     link_val w:link         val
