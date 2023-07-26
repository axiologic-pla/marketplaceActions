# organisationAudit

## Installation Requirement

- Generate a new Personal access token (PAT) with the following access scope:
    - repo _(Full control of private repositories)_
- Copy the generated PAT
- Create a new repository secret in one of your repository with the following name GET_INFO_TOKEN and paste the copied PAT

## Installation Process

### If the token exists in repository secret and has the correct value, the script can be run with the following steps

- Go to `Actions` from within that repository where the script is also located.
- On `All Workflows` an action called `Get Organization info` can be accessed and clicked.
- Run workflow.
- A file called ghReport.md will be generated in root `Code` with all the information about members/teams from within an organization and their roles.
