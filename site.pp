node 'agent-1' {
  $adminemail = 'rama@example.com'
  $servername = 'agent-a.example.com'

  include apache
  include apache::vhosts
#  include mysql::database
mysql::db { 'mydb':
  user     => 'root',
  password => '1qaz2wsx',
  host     => 'localhost',
  grant    => ['SELECT', 'UPDATE'],
}


  }
