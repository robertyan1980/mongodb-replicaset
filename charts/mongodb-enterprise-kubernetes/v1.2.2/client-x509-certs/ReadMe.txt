mongo --host mongodb-enterprise-operator-2 --port 27018 --tls --tlsCAFile ca.crt --tlsCertificateKeyFile x509-full.pem  --authenticationMechanism MONGODB-X509 --authenticationDatabase '$external'


#inside pod
cd ~
/var/lib/mongodb-mms-automation/mongodb-linux-x86_64-4.2.0/bin/mongo --host mongodb-enterprise-operator-2 --tls --tlsCAFile ca.pem --tlsCertificateKeyFile server.pem --authenticationMechanism MONGODB-X509 --authenticationDatabase '$external'


Link:
https://docs.mongodb.com/kubernetes-operator/master/tutorial/create-x509-client-certs/#create-x509-certs
https://docs.mongodb.com/kubernetes-operator/master/tutorial/manage-database-users-x509/#add-a-database-user
