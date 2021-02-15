# diagram.py
from diagrams import Cluster, Diagram
from diagrams.gcp.storage  import Storage

with Diagram("GCP storage", show=False):
     Storage("Bucket")
