require 'sinatra'
require 'bcrypt'
require './db/db'

enable :sessions

# CONTROLLERS
require './controllers/non_users_sessions_controller'
require './controllers/non_users_controller'
require './controllers/notes_controller'
require './controllers/users_controller'
require './controllers/sessions_controller'



# MODELS
require './models/non_users_note'
require './models/note'
require './models/user'


# HELPERS
require './helpers/sessions_helper'
require './helpers/non_users_session_helper'