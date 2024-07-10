import io
import pandas as pd
import requests
from pandas import DataFrame
import kaggle
import os
import subprocess
import zipfile

if 'data_loader' not in globals():
    from mage_ai.data_preparation.decorators import data_loader
if 'test' not in globals():
    from mage_ai.data_preparation.decorators import test


@data_loader
def load_data_from_api(**kwargs) -> DataFrame:
    BASE_DIR = "data/"
    DATASET_NAME = "player-scores"
    DATASET_FILE = "player_valuations.csv"
    dataset_path = os.path.join(BASE_DIR, DATASET_FILE + ".zip")

    try:
        result = subprocess.run(["kaggle", "datasets", "download", f"davidcariboo/{DATASET_NAME}", "-f", f"{DATASET_FILE}", "-p", BASE_DIR])
        if result.returncode == 0:
            print("Dataset downloaded successfully.")

            with zipfile.ZipFile(dataset_path, "r") as zip_ref:
                zip_ref.extractall(BASE_DIR)
                print("Dataset extracted to:", BASE_DIR)
                df = pd.read_csv(dataset_path)
                return df
                
        else:
            print("Error downloading dataset:")
            print(result.stderr)

    except Exception as e:
        print("Exception occurred while downloading dataset:")
        print(str(e))


@test
def test_output(df) -> None:
    """
    Template code for testing the output of the block.
    """
    assert df is not None, 'The output is undefined'
