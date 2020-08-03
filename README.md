
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
to modify the style object of xml w/o error-prone actions.

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
modified simaltanaoutsly.

    library(stylex)

    # set the complete file path
    file = "sample.docx"

    # get xml object from style.xml in the target docx
    xml <- read_style_xml(file)

    # extract style tags from xml object of style.xml
    style_xml <- get_style_tags(xml)

    # transform to data.frame by style_xml object.
    d <- style2df(style_xml)

    # try to modify by specifing style_id and column name.
    d[d$style_id=="1","r_sz_val"] <- "400"

    # update xml file by updated data.frame with original docx file.
    xml <- update_xml(file, d)

    # write the modified docx file.
    write_style(xml, file, "modified.docx")

Example 2
---------

Internally, `stylex` package uses functions to each tags in docx file.
Users can use these functions by calling with `:::` because these are
internal functions.

    library(stylex)

    file = "sample.docx"
    xml <- read_style_xml(file)
    style_xml <- get_style_tags(xml)

    # node extract by tag name of "Date".
    node <- get_node_by_name(style_xml, "Date")

    # users can identify the node by style_id.
    # This is more adequate because id is unique in the docx.
    # node <- get_node_by_id(style_xml, "1")

    # by name, you must write that exactly, i.e. white spaces.
    # node <- get_node_by_name(style_xml, "heading 5")

    # Because the node is an object of xml2, prior to View it load xml2 package.
    # library(xml2)
    # View(node)

    # set the value by each functions to each tags.
    # when node object changes, original xml object is also changed.
    stylex:::set_r_sz_val(node, "42")
    stylex:::set_r_color_themecolor(node, "accent2")
    stylex:::set_p_spacing_before(node, 2000)
    stylex:::set_r_b(node, T)

    write_style(xml, file, "modified.docx")

Example 3
=========

`stylex` package can create new style based on existing style. Now
`create_new_style` is non-exported function.

    library(stylex)

    file = "sample.docx"
    xml <- read_style_xml(file)
    style_xml <- get_style_tags(xml)

    modified_xml <- stylex:::create_new_style(style_xml, "Author_based_new_style", "Author")

node structure
==============

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
