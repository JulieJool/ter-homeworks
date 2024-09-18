[webservers]
%{ for server in webservers ~}
${server.name} ansible_host=${server.ip} fqdn=${server.fqdn}
%{ endfor ~}

[databases]
%{ for db in databases ~}
${db.name} ansible_host=${db.ip} fqdn=${db.fqdn}
%{ endfor ~}

[storage]
%{ for st in storage ~}
${st.name} ansible_host=${st.ip} fqdn=${st.fqdn}
%{ endfor ~}

