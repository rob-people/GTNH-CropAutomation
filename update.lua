local shell = require('shell')
local config = require('config')
local scripts = {
    'setup.lua',
    'action.lua',
    'database.lua',
    'events.lua',
    'gps.lua',
    'scanner.lua',
    'autoStat.lua',
    'autoTier.lua',
    'autoSpread.lua',
    'infiniSpread.lua',
    'uninstall.lua'
}

-- UNINSTALL
for i=1, #scripts do
    shell.execute(string.format('rm %s', scripts[i]))
    shell.execute("rm config_default.lua")
    shell.execute("mv config.lua config_temp.lua")
    shell.execute("mv config.lua config_temp.lua")
    print('Removed current installation, downloading latest version')
    shell.execute(string.format('wget %s%s/setup.lua && setup', config.repoUrl, config.branch))
    print('Restoring config')
    shell.execute("mv config.lua config_default.lua")
    shell.execute("mv config_temp.lua connfig.lua")
    print(string.format('Updated to latest version of branch %s', config.branch))
end