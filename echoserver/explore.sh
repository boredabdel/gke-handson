#Nodes
NODES=$(kubectl get nodes -o jsonpath='{ $.items[*].status.addresses[?(@.type=="ExternalIP")].address }')
#NodePort
NODEPORT=$(kubectl get -o jsonpath="{.spec.ports[0].nodePort}" services echoserver-nodeport)
#NodePortLocal
NODEPORT=$(kubectl get -o jsonpath="{.spec.ports[0].nodePort}" services echoserver-nodeport-local)
#Query
for node in $NODES; do curl --connect-timeout 1 -s $node:$NODEPORT | grep -i client_address; done
#LB
curl http://xxx:8080 | grep grep -i client_address