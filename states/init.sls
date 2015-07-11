#!jinja|yaml

{% set datamap = salt['formhelper.defaults']('aptcacherng', saltenv) %}

# SLS includes/ excludes
include: {{ datamap.sls_include|default([]) }}
extend: {{ datamap.sls_extend|default({}) }}

aptcacherng:
  pkg:
    - installed
    - pkgs: {{ datamap.pkgs|default([]) }}
  service:
    - running
    - name: {{ datamap.service.name|default('apt-cacher-ng') }}
    - enable: {{ datamap.service.enable|default(True) }}

{% for i in datamap.config.manage %}
  {% set f = datamap['config'][i] %}
aptcacherng_conf_{{ i }}:
  file:
    - managed
    - name: {{ datamap.conf_dir|default('/etc/apt-cacher-ng') }}/{{ f.file_name|default(i) }}
    - mode: 644
    - user: root
    - group: root
  {% if 'contents' in f %}
    - contents_pillar: aptcacherng:lookup:config:{{ i }}:contents
  {% else %}
    - source: {{ f.source|default('salt://aptcacherng/files/' ~ i) }}
    - template: {{ f.template_renderer|default('jinja') }}
  {% endif %}
    - watch_in:
      - service: aptcacherng
{% endfor %}
