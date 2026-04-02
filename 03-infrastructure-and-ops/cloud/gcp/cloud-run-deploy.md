# Install gcloud CLI
- Select or create a project in Google Cloud Console
- Enable APIs in Google Cloud Console
- Use `getconf LONG_BIT` to determine OS version
- Then do `curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-410.0.0-linux-x86_64.tar.gz`(substitute with correct link based on OS version`
- Then do `tar -xf google-cloud-cli-410.0.0-linux-x86_64.tar.gz(substitute with correct downloaded file)
- Once unzipped, run `./google-cloud-sdk/install.sh` to install gcloud CLI
- Answer prompts accordingly, answer Y to add to binary path
- Then open a new terminal instance
- Then run `./google-cloud-sdk/bin/gcloud init` to initialize the gcloud CLI
- It will ask you to log in and select a project, as well as set the Compute Region and Time Zone

# Helpful gcloud CLI commands
`gcloud --help` to see the Cloud Platform services that you can interact with
`gcloud help COMMAND` to get help for a specific gcloud command
`gcloud topic --help` to learn about advanced features of the SDK like arg files and output formatting
`gcloud cheat-sheet` to see a roster of go-to gcloud commands

# Prepping the Environment
- Set the default project configuration by running `gcloud config set project PROJECT_ID`

# Preparing the backing storage
- important to deploy all services for a project to the same region

# Setting up a PostgreSQL instance in Cloud SQL
- create the Postgres instance by running the following gcloud command
```
gcloud sql instances create INSTANCE_NAME \
    --database-version POSTGRES_12 \
    --tier db-f1-micro \
    --region REGION
```
- create the database within the created Cloud SQL instance
```
gcloud sql databases create DATABASE_NAME \
    --instance INSTANCE_NAME
```
- generate a random password for a user and save it to a file called `dbpassword` with the following command
```
cat /dev/urandom | LC_ALL=C tr -dc '[:alpha:]'| fold -w 50 | head -n1 > dbpassword
```
- IMPORTANT: Any users created with Cloud SQL with have permissions with the cloudsqlsuperuser role: CREATEROLE, CREATEDB, and LOGIN.
- Create a user and set the user with the randomly generated password
```
gcloud sql users create DATABASE_USERNAME \
   --instance=INSTANCE_NAME --password=$(cat dbpassword)
```

# Creating a CloudStorage Bucket
- use `gsutil` to create a CloudStorage Bucket instance
```
gsutil mb -l REGION gs://PROJECT_ID-MEDIA_BUCKET_SUFFIX
```
- Once the bucket is created, permissions need to be changed in order to make images public
```
gsutil iam ch allUsers:objectViewer gs://PROJECT_ID-MEDIA_BUCKET_SUFFIX
```

# Store secrets in Secret Manager
- create an encrypted credentials file and key for the given project
- copy and paste the database instance password to the credential file as such
```
secret_key_base: GENERATED_VALUE
gcp:
  db_password: PASSWORD
```
- create a new secret in Secret Manager by doing the following command(Replace RAILS_SECRET_NAME with whatever)
```
gcloud secrets create RAILS_SECRET_NAME --data-file config/master.key
```
- confirm that secret was added by doing
```
gcloud secrets describe RAILS_SECRET_NAME
gcloud secrets versions access latest --secret RAILS_SECRET_NAME
```
- to get the value of the project number, run the following command
```
gcloud projects describe PROJECT_ID --format='value(projectNumber)'
```
- grant access to the secret to the cloud run service
```
gcloud secrets add-iam-policy-binding RAILS_SECRET_NAME \
    --member serviceAccount:PROJECTNUM-compute@developer.gserviceaccount.com \
    --role roles/secretmanager.secretAccessor
```
- grant access to the secret to the cloud build service
```
gcloud secrets add-iam-policy-binding RAILS_SECRET_NAME \
    --member serviceAccount:PROJECTNUM@cloudbuild.gserviceaccount.com \
    --role roles/secretmanager.secretAccessor
```
- confirm that there are two bindings in the output, one for the run service and one for the build service

# Connecting a rails project to the Cloud SQL and CloudStorage Bucket
- To connect the rails project, you must add the following values to the credentials file(might need to be ENV variables)
```
gcp:
  db_name: DATABASE_NAME
  db_username: DATABASE_USERNAME
  cloud_sql_connection_name: PROJECT_ID:REGION:INSTANCE_NAME
  google_project_id: PROJECT_ID
  storage_bucket_name: PROJECT_ID-MEDIA_BUCKET_SUFFIX
```
- In order for Cloud Build to apply data migrations to the db, you must grant access to it by doing the following
```
gcloud projects add-iam-policy-binding PROJECT_ID \
    --member serviceAccount:PROJECTNUM@cloudbuild.gserviceaccount.com \
    --role roles/cloudsql.client 
```
- To deploy the rails app as the new Cloud Run service, we first need to add a `cloudbuild.yml` and build the image using Cloud Build
```
gcloud builds submit --config cloudbuild.yaml \
    --substitutions _SERVICE_NAME=SERVICE_NAME,_INSTANCE_NAME=INSTANCE_NAME,_REGION=REGION,_SECRET_NAME=RAILS_SECRET_NAME
```
- After the image gets built, we can finish the deployment, by deploying the image to the Cloud Run instance
```
gcloud run deploy SERVICE_NAME --platform managed --region REGION --image gcr.io/PROJECT_ID/SERVICE_NAME --add-cloudsql-instances PROJECT_ID:REGION:INSTANCE_NAME --allow-unauthenticated --port=PORT
```

# Debugging
```
gcloud beta run services logs tail SERVICE_NAME --project PROJECT_ID
```
