class helloworld {
  notify{ 'helloworld':
    message => "Hello ${::hostname}!",
  }
}
