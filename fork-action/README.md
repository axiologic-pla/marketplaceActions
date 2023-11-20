# organizationAudit

## Installation Process

- Select a repository
- Go to `Actions`.
- Create a new `Workflow` file with the following content:
```
name: Fork Organization Repositories

on:
  workflow_dispatch:
    inputs:
      sourceOrg:
        type: string
        description: 'Name of the organization to fork from.'
        required: true
      targetOrg:
        type: string
        description: 'Name of the organization to fork to.'
        required: true
  
jobs:
  fork_repositories:
    runs-on: ubuntu-latest

    steps:
      - name: 'Run script to fork repositories'
        uses: axiologic-pla/marketplaceActions/fork-action/action.yaml
        with:
         source_org: ${{ inputs.sourceOrg }}
         target_org: ${{ inputs.targetOrg }}
         github_token: ${{ secrets.GITHUB_TOKEN }}
  ```
- Generate a new Personal access token (PAT) with the following access scope:
    - repo _(Full control of private repositories)_
- Copy the generated PAT
- Create a new secret called GITHUB_TOKEN and paste PAT
- At this point the GitHub Action should be ready to run.
