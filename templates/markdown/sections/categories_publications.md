<h1>{{ name }}
<a class="btn btn-sm btn-primary" role="button" href='javascript:;' onclick="$('.collapse').collapse('show')">Show all</a>
<a class="btn btn-sm btn-primary" role="button" href='javascript:;' onclick="$('.collapse').collapse('hide')">Hide all</a>
</h1>
Click on section title to see details.

<br>
{% for type_content in content %}

<h2>
<a data-toggle="collapse" href="#{{type_content.title_id}}" aria-expanded="false" aria-controls="#{{type_content.title_id}}">
<i class="fa fa-chevron-right"></i>
<i class="fa fa-chevron-down"></i>
{{type_content.title}}
</a>
</h2>

<div id="{{type_content.title_id}}" class="collapse">
{{ type_content.details }}
</div>
<br>
{% endfor %}

<a class="btn btn-sm btn-primary" role="button" href='javascript:;' onclick="$('.collapse').collapse('show')">Show all</a>
<a class="btn btn-sm btn-primary" role="button" href='javascript:;' onclick="$('.collapse').collapse('hide')">Hide all</a>