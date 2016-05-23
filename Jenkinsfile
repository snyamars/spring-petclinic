
stage 'Dev'
node {
  checkout scm
  bat 'mvn validate' 
  bat 'mvn compile'
  bat 'mvn test'
  bat 'mvn package'
  bat 'mvn sonar:sonar'
   dir('target') {stash name: 'war', includes: 'x.war'}
   
}

