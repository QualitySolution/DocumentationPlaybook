properties([
  pipelineTriggers ([
    upstream(
      threshold: 'UNSTABLE', 
      upstreamProjects: "QS/QSInside/master, QS/Workwear/master, QS/Workwear/release%2F2.5, QS/Workwear/release%2F2.6, QS/Workwear/release%2F2.7, QS/Workwear/release%2F2.8"
    )
  ])
])

node{
  stage('Git') {
    checkout([
      $class: 'GitSCM',
      branches: scm.branches,
      doGenerateSubmoduleConfigurations: scm.doGenerateSubmoduleConfigurations,
      extensions: scm.extensions + [submodule(disableSubmodules: false, recursiveSubmodules: true)],
      userRemoteConfigs: scm.userRemoteConfigs
    ])
  }
  stage('Dependencies') {
    sh 'npm ci'
  }
  stage('Build') {
    sh 'antora generate --fetch --stacktrace antora-playbook.yml'
  }
  if(env.BRANCH_NAME == 'master')
  {
    stage('Publish'){
      sh 'rsync -viza --checksum --delete build/site/ a218160_qso@a218160.ftp.mchost.ru:subdomains/doc/httpdocs'
    }
  }
}