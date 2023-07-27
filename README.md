# organisationAudit

## Installation Process

- Generate a new Personal access token (PAT) with the following access scope:
    - repo _(Full control of private repositories)_
    - Copy the generated PAT
- Selecte a repository
- Go to `Actions` from within that repository where the script is also located.
- On `All Workflows` an action called `Get Organization info` can be accessed and clicked.
- Run workflow.
    - Paste the generated PAT
    - Enter the name of the file which will be generated
- A file with the given name will be generated in root `Code` with all the information about members/teams from within an organization and their roles.
