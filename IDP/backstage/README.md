# Install Backstage's prerequisites:

Link: https://backstage.io/docs/getting-started/
![alt text](image.png)

NVM:
# installs NVM (Node Version Manager)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

# download and install Node.js
nvm install 20

# verifies the right Node.js version is in the environment
node -v # should print `v20.12.2`

# verifies the right NPM version is in the environment
npm -v # should print `10.5.0`Yarn:

yarn:
https://classic.yarnpkg.com/en/docs/install#windows-stable

Docker:
https://www.cyberciti.biz/faq/how-to-install-docker-on-amazon-linux-2/

Git:
https://github.com/git-guides/install-git

# Scaffold Backstage

npx @backstage/create-app@latest : fill in the prompts for app name

cd <my-backstage-app-name> # your app name

yarn dev

http://localhost:3000 or if using a cloud server, <public-ip-of-server>:3000

If 404 is displayed on opening the webpage, then make changes in app-config.yaml and add the DNS name of your webserver in the baseURL section
![alt text](image-1.png)

**BUG: if yarn install is stuck indefinitely, use 
npx @backstage/create-app@latest --skip-install 
then navigate to the app folder and run yarn install manually

# General folder structure:
app
├── app-config.yaml
├── catalog-info.yaml
├── package.json
└── packages
    ├── app
    └── backend
app-config.yaml: Main configuration file for the app.
catalog-info.yaml: Catalog Entities descriptors.
package.json: Root package.json for the project.
packages/: Lerna leaf packages or "workspaces". Everything here is going to be a separate package, managed by lerna.
packages/app/: An fully functioning Backstage frontend app, that acts as a good starting point for you to get to know Backstage.
packages/backend/: We include a backend that helps power features such as






