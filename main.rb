require 'sinatra'
require 'bcrypt'
require './db/db'

# CONTROLLERS
require './controllers/notes_controller'
require './controllers/users_controller'

# MODELS
require './models/note'
require './models/user'