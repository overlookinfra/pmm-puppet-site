def merge(from, to) {
  sh('git checkout ' + to)
  sh('git merge ' + from + ' --ff-only')
}

def promote(Map parameters = [:]) {
  String from = parameters.from
  String to = parameter.to

  merge(from, to)

  sh('git push origin ' + to)
}

node {
    git branch: 'dev', credentialsId: 'github-ccaum-key', url: 'git@github.com:puppetlabs-pmmteam/puppet-site'

    stage 'Lint and unit tests'
    sh 'rspec spec/'

    stage 'Deploy to dev'
    puppetCode environment: 'dev', credentialsId: 'pe-access-token'
    puppetJob  environment: 'dev', credentialsId: 'pe-access-token'

    stage 'Promote to staging'
    input "Ready to deploy to staging?"
    promote from: 'dev', to: 'staging'
    
    stage 'Deploy to staging'
    puppetCode environment: 'staging', credentialsId: 'pe-access-token'
    puppetJob  environment: 'staging', credentialsId: 'pe-access-token'

    stage 'Staging acceptance tests'

    stage 'Promote to production'
    input 'Ready to deploy to production?'
    promote from: 'staging', to: 'production'

    stage 'Deploy to production'
    puppetCode environment: 'production', credentialsId: 'pe-access-token'
    puppetJob  environment: 'production', credentialsId: 'pe-access-token'
}