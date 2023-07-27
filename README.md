# organisationAudit

## Installation Process

- Selecte a repository
- Go to `Actions`.
- Create a new `Workflow` file with the following content:
```
name: Get Organization Info

on:
  workflow_dispatch:
    inputs:
      outputFileName:
        type: string
        description: 'Enter how the output file should be called.'
        required: true
        default: 'AuditResult'
  
jobs:
  get_information:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout repository
        uses: actions/checkout@v3
        
      - name: Get Organization Info
        uses: axiologic-pla/organisationAudit@v.1.0.3
        with:
         secretToken: ${{ secrets.AUDIT_TOKEN }}
         outputFileName: ${{ github.event.inputs.outputFileName }}
  ```
- Generate a new Personal access token (PAT) with the following access scope:
    - repo _(Full control of private repositories)_
- Copy the generated PAT
- Create a new secret called AUDIT_TOKEN and paste PAT
- At this point the GitHub Action should be ready to run.
