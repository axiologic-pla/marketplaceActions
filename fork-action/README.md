# Fork Organization Repositories

## Note Before Beginning

If you're planning to fork private repositories, please ensure that the 'Allow Forking' option is enabled in your
organization settings. This step is crucial for a smooth forking process and to respect the privacy settings of 
each repository.

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
      - name: 'Checkout repository'
        uses: actions/checkout@v4

      - name: 'Run script to fork repositories'
        uses: axiologic-pla/marketplaceActions/fork-action@main
        with:
         source_org: ${{ inputs.sourceOrg }}
         target_org: ${{ inputs.targetOrg }}
         github_token: ${{ secrets.TOKEN }}

  ```
- Generate a new Personal access token (PAT) that has access to both organizations (source and target) with the following access scope:
    - repo _(Full control of private repositories)_
- Copy the generated PAT
- Create a new secret called TOKEN and paste PAT
- At this point the GitHub Action should be ready to run.
