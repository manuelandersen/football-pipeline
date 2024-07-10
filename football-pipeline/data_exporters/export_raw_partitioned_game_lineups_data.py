import pyarrow as pa
import pyarrow.parquet as pq
import os
import pandas as pd

if 'data_exporter' not in globals():
    from mage_ai.data_preparation.decorators import data_exporter

os.environ['GOOGLE_APPLICATION_CREDENTIALS'] = "/home/src/credentials.json"

bucket_name = 'data-lake-football-pipeline'
project_id = 'football-pipeline-428816'
table_name = "game_lineups_partitioned"
root_path = f'{bucket_name}/data/{table_name}'

@data_exporter
def export_data(df, *args, **kwargs):

    df['new_date'] = pd.to_datetime(df['date'])
    df['year_month'] = df['new_date'].dt.strftime('%Y-%m')

    table = pa.Table.from_pandas(df)

    gcs = pa.fs.GcsFileSystem()

    pq.write_to_dataset(
        table,
        root_path=root_path,
        partition_cols=['year_month'],
        filesystem=gcs
    )
