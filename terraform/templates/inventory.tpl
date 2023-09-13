[all]
%{ for index, ip in master_nodes ~}
master${index+1} ansible_host=${ip}
%{ endfor ~}
%{ for index, ip in worker_nodes ~}
worker${index+1} ansible_host=${ip}
%{ endfor ~}

[kube_control_plane]
%{ for index, ip in master_nodes ~}
master${index+1}
%{ endfor ~}

[etcd]
%{ for index, ip in master_nodes ~}
master${index+1}
%{ endfor ~}

[kube_node]
%{ for index, ip in worker_nodes ~}
worker${index+1}
%{ endfor ~}

[calico_rr]

[k8s_cluster:children]
kube_control_plane
kube_node
calico_rr