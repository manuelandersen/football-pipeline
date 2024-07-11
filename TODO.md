1)  Initial Set up

    -   [x] Get Kaggle API credentials and how to download the data. (Try it with a notebook or with a simple python script)
    -   [x] Dockerfile
    -   [x] Get Mage running on the container.

2)  Mage --\> GCS

    -   [x] Could try to run ingestion of data from kaggle to the GCS bucket toy i got for the course

3)  Terraform

    -   [x] Make terraform files to IaC GCS and Bigquery

4)  Mage --\> GCS

    -   [x] Once we have terraform running, start the ingestion from kaggle --\> GCS

5)  Mage: GCS --\> Big Query

    -   [x] Start the ingestion from the data lake to the data warehouse, or is it that we need to use dbt to this?

6)  dbt transformation

    -   [ ] Transform the data to make it very queriable(?).

7)  Looker Studio

    -   [ ] Create the dashboards

8)  Write good README

    -   \[ \]

RULES OF COMMIT:

-   feat: The new feature you're adding to a particular application
-   fix: A bug fix
-   style: Feature and updates related to styling
-   refactor: Refactoring a specific section of the codebase
-   test: Everything related to testing
-   docs: Everything related to documentation
-   chore: Regular code maintenance.\[ You can also use emojis to represent commit types\]