# Parsed attributes for java opts
default['tomcat']['java_options_custom'] = ""
default['solr']['tomcat']['xmx'] = "512m"
default['solr']['tomcat']['xms'] = "256m"
default['solr']['tomcat']['xmx_percent'] = 70
default['solr']['tomcat']['xms_percent'] = 40

# Overrides for tomcat cookbook
default['tomcat']['base_version'] = "6"
default['tomcat']['loglevel'] = 'WARN'
