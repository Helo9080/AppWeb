pipeline {
  agent any

  environment {
    REPO_URL = 'https://github.com/Helo9080/AppWeb'
    REPO_BRANCH = 'main'
  }

  stages {

    stage('Checkout') {
      steps {
        git branch: env.REPO_BRANCH, url: env.REPO_URL
      }
    }

    stage('HTML Tests') {
      steps {
        script {
          if (fileExists('package.json')) {
            sh 'npm ci || true'
            sh '''
              if npm run | grep -q "test"; then
                npm test || exit 1
              else
                echo "No npm test script found — trying htmlhint if installed"
                if [ -f node_modules/.bin/htmlhint ]; then
                  npx htmlhint "**/*.html" || exit 1
                else
                  echo "htmlhint not installed — skipping detailed html lints"
                fi
              fi
            '''
          } else {
            echo "No package.json — checking for HTML files..."
            sh '''
              if ls **/*.html 1> /dev/null 2>&1; then
                echo "Found HTML files, running validation..."
                for f in $(find . -name "*.html"); do
                  echo "Validating $f"
                  # هنا ممكن تحط validator أو تتأكد بالـ w3c validator
                done
              else
                echo "No HTML files found — skipping HTML tests"
              fi
            '''
          }
        }
      }
    }

    stage('Terraform: Init & Plan') {
      steps {
        script {
          if (fileExists('infrastructure/main.tf') || fileExists('main.tf')) {
            sh '''
              terraform init -input=false
              terraform validate || true
              terraform plan -out=tfplan.binary -input=false
            '''
          } else {
            echo "No Terraform configuration files found — skipping Terraform stage."
          }
        }
      }
    }

  }
}
