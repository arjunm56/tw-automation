
CI/CD Pipeline using GitHub, Helm, GCP GKE:

Git Repo: https://github.com/arjunm56/tw-automation.git


(Note: GCP GKE cluster(gke-arjun-cluster) is to be created before running below steps. It will be deleted when not in use)

Step 1: Add/Push to main branch. For ex: edit readme and push.
Step 2: GitHub Workflow Actions trigger the jobs that has Build, Publish and Deploy jobs for MariaDB server and Mediawiki application with seperate Dockerfiles. 
Step 3: Access the Ingress/URL http://<ADDRESS>/ (Pick a ADDRESS from GitHub Actions --> Helm mediawiki release workflow --> Deploy Step --> End of the log as showin below.)

    NAME                              CLASS    HOSTS             ADDRESS          
elb-123                           <none>   *                 34.111.21.104 

Step 4: Finish the steps in the Mediawiki. Provide the MariaDB IP in DB hostname field.(Pick a MariaDB IP from GitHub Actions --> Helm mediawiki release workflow --> Deploy Step --> End of the log as showin above.)

Troubleshooting steps:

1. Ingress might take time to come up, verify backend services if healthy

2. Verify Github repo --> Actions --> Workflows to see all information/error related to build, publish, deployment

3. Sometimes, mediawiki httpd service might be down. Restart php-fpm, httpd service to solve the issue.
