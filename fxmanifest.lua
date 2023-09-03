-- Resource Metadata
fx_version 'cerulean'
games   { 'rdr3', 'gta5' } 
lua54 'yes'
author 'miskaslzickou'
description ''
version '1.0.0'

dependencies {
	
    'ox_target',
    'ox_lib'
    
}
-- What to run
client_script 'client.lua'
    
 
   
   



shared_scripts {  '@ox_lib/init.lua' }