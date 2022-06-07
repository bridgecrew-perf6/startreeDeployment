## Deployer for CertManager and Apache Pinot servers 

1) deployer helm service will deploy to each environment i.e., GKE cluster in its own namespace

2) The rationale behind having our own deployer would be to have a highly scalable out of the box deployer which can have configuration as per the need of the environment.
   - for example the QA or UAT deployer should be having more replicas to serve as compared to PROD environment. 
   - This is because the cycle for release into QA and UAT would be much more and PROD might have a release only in atleast one sprint cycle OR more.

3) The deployer having its own environment will ensure we do not need an enterprise gitlab runner to maintain and any simple VCS solution can be used. This will save costs w.r.t owners & maintainers for the gitlab runners.

4) We will need to invoke the deployer everytime there is a Merge to master branch of code which needs to be deployed.

5) deployer service should also be able to deploy on local minikube/kind for testing. Have created a skeletal MakeFile as well for running the same.

6) There can be two approaches for architecting the infrastructure deployment 
   - Either have one super cluster with custom CRDs to maintain the cluster along with dev,qa,sit/uat,preprod and prod clusters all in one.
   - OR have multiple clusters each having its own functions again with custom CRDs to maintain cluster.
