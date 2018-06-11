print 'connecting to admin server....'

connect( 'usuario', 'password', 't3://localhost:7001', adminServerName='AdminServer' )

print 'deploying....'

deploy('nombre-app', '/home/oracle/wls_domain/servers/AdminServer/upload/app.war', targets='wls_server1')

print 'subiendo ...'

startApplication('nombre-app')

print 'fin'

