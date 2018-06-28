print 'connecting to admin server....'

connect( 'nombre-app', 'password', 't3://localhost:7001', adminServerName='AdminServer' )

print 'stopping and undeploying ....'

stopApplication('nombre-app')

undeploy('nombre-app')

print 'fin'

