env = require('test_run')
test_run = env.new()
test_run:cmd("create server master1 with script='callback/master1.lua', lua_libs='callback/lua/connpool.lua'")
test_run:cmd("create server master2 with script='callback/master2.lua', lua_libs='callback/lua/connpool.lua'")
test_run:cmd("start server master1")
test_run:cmd("start server master2")

pool:wait_connection()
pool:wait_table_fill()
results

_ = test_run:cmd("stop server master1")
_ = test_run:cmd("stop server master2")
test_run:cmd("cleanup server master1")
test_run:cmd("cleanup server master2")
test_run:cmd("restart server default with cleanup=1")
