print 'connecting to admin server....'

connect( 'weblogic', 'Password', 't3://localhost:7001', adminServerName='AdminServer' )

f = open ('/tmp/asimupersona.txt','w')
f.write('OK')
f.close()


myapps=cmo.getAppDeployments()

for appName in myapps:
       domainConfig()
       cd ('/AppDeployments/'+appName.getName()+'/Targets')
       mytargets = ls(returnMap='true')
       domainRuntime()
       cd('AppRuntimeStateRuntime')
       cd('AppRuntimeStateRuntime')
       for targetinst in mytargets:
             curstate4=cmo.getCurrentState(appName.getName(),targetinst)
             if appName.getName()=="AsimuPersona" :
                if curstate4!="STATE_ACTIVE" :
                        f = open ('/tmp/asimupersona.txt','w')
                        f.write('FALLA')
                        f.close()
