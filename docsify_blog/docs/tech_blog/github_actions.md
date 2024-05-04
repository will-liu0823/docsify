#   Github Actions
### Runners
-   self-hosted
1.  create runner
2.  configure
3.  runs-on: self-hosted
-   github-hosted
1.  runs-on: ubuntu-latest
### Create secrets steps:
-   dependabot secrets
1.  SSH_HOST
2.  SSH_USERNAME
3.  DEPLOY_KEY
-   use script
```shell
    steps:
        -   name:   auto_deploy
            with:
                SSH_HOT: ${{ secrets.SSH_HOST }}
                SSH_USERNAME: ${{ serects.SSH_USERNAME }}
                DEPLOY_KEY: ${{ serects.DEPLOY_KEY }}
            run:    |
                sh xxx
```
