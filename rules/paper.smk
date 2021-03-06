# Rules: paper
#
# rticle-style: asa
#
# contributors: @lachlandeer, @julianlanger, @bergmul

# --- Dictionaries --- #
RMD_FILES  = glob.glob(config["src_paper"] + "*.Rmd")
YAML_FILES = glob.glob(config["src_paper"] + "*.yml")
BIB_FILES  = glob.glob(config["src_paper"] + "*.bib")
TEX_FILES  = glob.glob(config["src_paper"] + "*.tex")

# --- Build Rules --- #
## paper2root:   copy paper to root directory
rule paper2root:
    input:
        pdf  = config["out_paper"] + "my_article.pdf",
    output:
        pdf  = PROJ_NAME + ".pdf",
    shell:
        "cp {input.pdf} {output.pdf}"

## knit_pdf: builds pdf using bookdown
rule knit_pdf:
    input:
        text_files = RMD_FILES,
        yaml_files = YAML_FILES,
        biblo      = BIB_FILES,
        tex_style  = TEX_FILES,
        tables     = expand(config["out_tables"] +
                            "{iTable}.tex",
                            iTable = TABLES),
        figures = expand(config["out_figures"] +
                            "{iPlot}.pdf",
                            iPlot = PLOTS),
        runner     = config["src_lib"] + "build_pdfbook.R"
    output:
        config["out_paper"] + "my_article.pdf"
    log:
        config["log"] + "paper/build_pdf.Rout"
    shell:
        "{runR} {input.runner} > {log} {logAll}"
