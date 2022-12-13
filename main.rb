require 'sinatra'
require 'bcrypt'
require './db/db'

enable :sessions

# CONTROLLERS
require './controllers/notes_controller'
require './controllers/users_controller'
require './controllers/sessions_controller'

# MODELS
require './models/note'
require './models/user'