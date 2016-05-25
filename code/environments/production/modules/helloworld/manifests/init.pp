# Helloworld class
class helloworld
  ( $server = 'Unknown'){
  notify { 'Say hello':
    message => "Hello from ${::environment}",
  }
}
