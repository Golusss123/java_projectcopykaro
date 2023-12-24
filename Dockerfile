steps:
  # Docker Build
  - name: 'gcr.io/cloud-builders/docker'
    args: ['build', '-t', 
           'gcr.io/my-project/my-repository', 
           '.']

  # Docker Push
  - name: 'gcr.io/cloud-builders/docker'
    args: ['push', 
           'gcr.io/my-project/my-repository']

  # Entrypoint, timeout and environment variables
  - name: 'gcr.io/google.com/cloudsdktool/cloud-sdk'
    entrypoint: 'gcloud'
    timeout: 240s
    args: ['compute', 'instances', 
           'create-with-container', 'my-vm-name',
           '--container-image', 
           'gcr.io/my-project/my-repository']
    env:
      - 'CLOUDSDK_COMPUTE_REGION=us-central1'
      - 'CLOUDSDK_COMPUTE_ZONE=us-central1-a'
