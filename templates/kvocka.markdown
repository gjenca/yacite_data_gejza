{{ extra.title }}
=================
# for rec in records:
# if rec.myown
# if rec.citedby:

* * * * *

Článok:
-------

{{  rec.authors|authorsformat("{f. }{vv}{ll{ }}{, jj}")|join(", ") }}:
*{{rec.title}}*,
{{rec.journal}},
**{{rec.volume}}**
({{rec.year}})
{{rec.startpage}}-{{rec.endpage}}

Citovaný v (počet {{ rec.citedby | length }}):
----------------------------------------------

{% for rec_cited in rec.citedby %}
1. {{  rec_cited.authors|authorsformat("{f. }{vv}{ll{ }}{, jj}")|join(", ") }}: *{{rec_cited.title}}*
{%- if rec_cited.journal %}
   {{rec_cited.journal}},
{%- endif %}
{%- if rec_cited.series %}
   {{rec_cited.series}},
{%- endif %}
   *{{rec_cited.volume}}*
   ({{rec_cited.year}})
   {{rec_cited.startpage}}-{{rec_cited.endpage}}
{%- endfor %}
{%- endif %}
{%- endif %}
{%- endfor %}

