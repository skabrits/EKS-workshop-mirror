# DevOps Kubernetes workshop

## Prereqs

1. Create config file: put file `authData.yaml` under the path `scripts/` with following content:

```
AWS_ACCESS_KEY_ID=**************************
AWS_SECRET_ACCESS_KEY=**************************
TF_VAR_main_region=us-east-1
TF_VAR_region=us-east-2
```

2. Delete `scripts/authData.yaml.zip` if it exists

3. Put usernames in file `scripts/users.txt` 

## Deployment

Run `./scripts/do_all "helloworld"` to deploy infrastructure.

## User data

You can find user data in scripts/manifests/configs/username.txt