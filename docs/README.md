# How to replicate the project

1) Get a Kaggle API key and a project inside Google Cloud, download the project credentials to connect via API to gcs and BigQuery. 
2) Clone the repo. Place the credentials inside the project.
2) Inside the project make a .env file and paste *with your information* the following: 
```python
PROJECT_NAME=your-project-name

GCS_BUCKET_NAME=your-bucket-name

GCLOUD_PROJECT_NAME=your-gcloud-project-name

KAGGLE_USERNAME=your-kaggle-username
KAGGLE_KEY=your-kaggle-key
```

3) In your terminal run `docker compose build`, let it build and then run `docker compose up`.
4)  In your browser open `http://localhost:6789/`.
5) Run the pipeline `load_all_raw_data_to_gcs` and the run the pipeline `load_all_raw_data_to_bq`.
6)  Open the project in dbt cloud and run `dbt build`.
7) The data should be ready in BigQuery and you could start a report in LookerStudio.