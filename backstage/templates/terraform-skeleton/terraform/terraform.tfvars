{%- if values.projectName %}
  {%- set name = values.projectName %}
{%- else %}
  {%- set name = values.repoName %}
{%- endif -%}

project_name = "${{ name }}"

{%- if values.instanceType %}
instance_type = "${{ values.instanceType }}"
{%- else %}
instance_type = "t4g.micro"
{%- endif %}

{%- if values.databaseType %}
db_instance_class = "${{ values.databaseType }}"
{%- else %}
db_instance_class = "db.t4g.micro"
{%- endif %}

{%- if values.region %}
region = "${{ values.region }}"
{%- else %}
region = "us-east-1"
{%- endif %}


{%- if values.publicAccess %}
public_access = true
{%- else %}
public_access = false
{%- endif %}

{%- if region == "us-east-1" %}
vpc_id = "vpc-0e2fd71e4d9b6fec5"
{%- elif region == "eu-central-1" %}
vpc_id = "vpc-3707605d"
{%- elif region == "eu-central-2" %}
vpc_id = "vpc-09321946b9adb23fa"
{%- else %}
vpc_id = "vpc-0e2fd71e4d9b6fec5"
{%- endif %}
