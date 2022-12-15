require 'sinatra'
require 'bcrypt'
require './db/db'

enable :sessions

# CONTROLLERS
require './controllers/notes_controller'
require './controllers/temp_notes_controller'
require './controllers/users_controller'
require './controllers/calendar_controller'
require './controllers/sessions_controller'

# MODELS

require './models/note'
require './models/user'

# HELPERS
require './helpers/sessions_helper'