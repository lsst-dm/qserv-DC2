---
apiVersion: v1
kind: ConfigMap
metadata:
  name: repl-creds
data:
  qserv: ''
---
apiVersion: batch/v1
kind: Job
metadata:
  name: ingest-register
  labels:
    app: qserv
    instance: qserv
    tier: register-ingest
spec:
  template:
    metadata:
      labels:
        app: qserv
        instance: qserv
        tier: ingest
    spec:
      containers:
      - command:
        - register-db.sh 
        image: <INGEST_IMAGE>
        imagePullPolicy: Always
        name: qserv-ingest
        volumeMounts:
          - name: repl-creds
            mountPath: /qserv/.lsst
      restartPolicy: OnFailure
      volumes:
        - name: repl-creds
          configMap:
            name: repl-creds