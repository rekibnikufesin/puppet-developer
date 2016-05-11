class hellolinux
  ( $server = 'Unknown'){
    notify { 'hellolinux':
      message => "Hello from ${server}!",
    }
  }
