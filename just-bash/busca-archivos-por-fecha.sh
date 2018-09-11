mkdir /tmp/ttt
touch -t 201808200001 /tmp/begin
touch -t 201808202359 /tmp/end
find /tmp/*.tmp -type f  -newer /tmp/begin -a ! -newer /tmp/end -exec cp -a {} /tmp/ttt/ \  ;
