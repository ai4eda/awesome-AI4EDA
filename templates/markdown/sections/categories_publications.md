# <i class="fa fa-chevron-right"></i> {{ name }}

<br>


{% for type_content in content %}

## <i class="fa fa-chevron-right"></i> {{type_content.title}}

{{ type_content.details }}

{% endfor %}
