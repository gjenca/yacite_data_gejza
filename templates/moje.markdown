
# for rec in records:
# if rec.myown:
 1. {{  rec.authors|join(",") }}: *{{rec.title}}*, {{rec.journal}}, **{{rec.volume}}** ({{rec.year}}) {{rec.startpage}}-{{rec.endpage}} 
# if rec.arxiv 
 [arXiv:{{rec.arxiv}}]({{rec.arxivurl}})
# endif
# endif
# endfor


