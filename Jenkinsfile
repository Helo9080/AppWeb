pipeline {
    agent any

    stages {
        stage('Clone Repo') {
            steps {
                git branch: 'main', url: 'https://github.com/Helo9080/AppWeb.git'
            }
        }

        stage('Test HTML') {
            steps {
                script {
                    def html = readFile('index.html')
                    if (!html.contains("<html")) {
                        error("❌ Test Failed: <html> tag not found in index.html")
                    }
                    echo "✅ HTML Test Passed"
                }
            }
        }
    }
}
